defmodule ProfessorStats.ScheduleService do
	import Ecto.Query

	alias ProfessorStats.Models.Repo
	alias ProfessorStats.ScheduleConfig
	alias ProfessorStats.TeamCalculator

	def start_link do
		import Supervisor.Spec, warn: false

        children = [
            worker(Task,[ProfessorStats.ScheduleService, :start_loop, []])
        ]

        opts = [strategy: :one_for_one, name: ScheduleService.Supervisor]
        Supervisor.start_link(children, opts)	
	end

	def start_loop do
		loop_process()
	end

	def loop_process do
		# get all configurations that are within 24 hours of now and not completed
		now = Ecto.DateTime.utc() 
		configs = Repo.all(
			from sc in ScheduleConfig,
				where: sc.run_date < ^now and sc.status == "WAITING",
			select: sc
		)
		
		teams = Repo.all(ProfessorStats.Team)
		configs
		|> Enum.each( fn config -> 

			teams
			|> Enum.each(fn team -> Task.start(fn -> 
				TeamCalculator.calculate_and_send(team, config)
			end) end)
		end)


		# run this check every half hour
		:timer.sleep(30000)
		loop_process()
	end

	def handle_info({:DOWN, ref, :process, _pid, _reason}, _any) do
		IO.puts "There was a process that was being monitored that went down #{ref}"	
	end
end