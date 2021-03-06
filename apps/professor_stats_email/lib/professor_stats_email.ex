defmodule ProfessorStats.Email do
	use Application
	require Logger

	def start(_type, args) do
		import Supervisor.Spec

		children = [
      		supervisor(ProfessorStats.Models.Repo, []),
			supervisor(ProfessorStats.CalcService,[]),
			supervisor(ProfessorStats.ScheduleService,[])
		]

		opts = [strategy: :one_for_one, name: ProfessorStats.Supervisor]

		Supervisor.start_link(children, opts)
	end
end
