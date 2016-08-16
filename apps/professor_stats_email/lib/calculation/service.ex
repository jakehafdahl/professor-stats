defmodule ProfessorStats.CalcService do

	alias ProfessorStats.CalcRegistry

	def start_link do
		import Supervisor.Spec, warn: false

        children = [
            supervisor(ProfessorStats.PlayerTable.Supervisor, []),
            worker(ProfessorStats.CalcRegistry, [ProfessorStats.CalcRegistry])
        ]

        opts = [strategy: :one_for_one, name: CalcService.Supervisor]
        Supervisor.start_link(children, opts)	
	end

    def get_player(player_id) do
        case CalcRegistry.lookup(CalcRegistry, player_id) do
            {:ok, player} -> 
                {:ok, player}
            :not_found -> 
                pid = CalcRegistry.create(CalcRegistry, player_id)
                {:ok, pid}
        end
    end

end