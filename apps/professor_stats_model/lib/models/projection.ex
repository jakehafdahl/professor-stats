defmodule ProfessorStats.PlayerProjection do
	use Ecto.Model
	import Ecto.Changeset

	schema "player_projections" do
		field :week, :integer
  		field :season_year, :integer
		field :rush_yards, :integer  		
    	belongs_to :player, ProfessorStats.Player, foreign_key: :player_id

    	timestamps
	end 

	def get_for_player_and_week(player, week, season_year) do
		from pp in ProfessorStats.PlayerProjection, where: ^player.id == pp.player_id and ^week == pp.week and ^season_year == pp.season_year , select: pp		
	end

	def apply_settings(projection, setting) do
		val = Map.get(projection, String.to_atom(setting.field))
		# val = 0;

		(val / setting.required_per) * setting.points_for
	end
end