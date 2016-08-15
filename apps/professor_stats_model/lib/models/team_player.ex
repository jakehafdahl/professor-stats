defmodule ProfessorStats.TeamPlayer do
	use Ecto.Model
	import Ecto.Changeset

	schema "team_players" do
    	belongs_to :team, ProfessorStats.Team, foreign_key: :team_id
    	belongs_to :player, ProfessorStats.Player, foreign_key: :player_id

    	timestamps
	end 

	@required_params ~w()
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end

	def team_players_for(team) do
		from tp in ProfessorStats.TeamPlayer, where: tp.team_id == ^team.id, select: tp
	end
end