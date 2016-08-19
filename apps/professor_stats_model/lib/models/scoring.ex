defmodule ProfessorStats.ScoringSetting do
	use Ecto.Schema
	import Ecto.Query
	import Ecto.Changeset

	schema "scoring_settings" do
  		field :position, :string
  		field :field, :string
  		field :points_for, :integer
  		field :required_per, :integer
  		belongs_to :leagues, ProfessorStats.League, foreign_key: :league_id

  		timestamps
	end 

	@required_params ~w(position field points_for required_per)
	@optional_params ~w()

	def get_for_league(league) do
		from s in ProfessorStats.ScoringSetting, where: s.league_id == ^league.id, select: s
	end

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end
end