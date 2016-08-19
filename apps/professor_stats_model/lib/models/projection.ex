defmodule ProfessorStats.PlayerProjection do
	@moduledoc """
	Data container to represent how a player is expected to do for a given week and season 
	"""
	use Ecto.Schema
	import Ecto.Query
	import Ecto.Changeset

	schema "player_projections" do
		field :week, :integer
  		field :season_year, :integer
		field :rush_yards, :integer  		
    	belongs_to :player, ProfessorStats.Player, foreign_key: :player_id

    	timestamps
	end 

	@required_params ~w(week season_year player_id)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end

	@doc """
	Gets a projection given a week and season_year
	"""
	def get_for_player_and_week(player, week, season_year) do
		from pp in ProfessorStats.PlayerProjection, where: ^player.id == pp.player_id and ^week == pp.week and ^season_year == pp.season_year , select: pp		
	end

	@doc """
	Takes a projection and setting and returns a value representing the points gained

	Returns a numeric value
	"""
	def apply_setting(nil, _), do: 0
	def apply_setting(projection, setting) do
		val = Map.get(projection, String.to_atom(setting.field))
		# val = 0;

		(val / setting.required_per) * setting.points_for
	end
end