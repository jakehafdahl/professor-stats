defmodule ProfessorStats.PlayerTable.Supervisor do
	use Supervisor

	# module attribute to store the supervisor name
	@name ProfessorStats.PlayerTable.Supervisor

	def start_link do
		Supervisor.start_link(__MODULE__,:ok, name: @name)
	end

	def start_table do
		Supervisor.start_child(@name, [])
	end

	def init(:ok) do
		children = [
			worker(ProfessorStats.PlayerTable, [], restart: :temporary)
		]

		supervise(children, strategy: :simple_one_for_one)
	end
end