defmodule ProfessorStats.League do
	use Ecto.Schema
	import Ecto.Query
	import Ecto.Changeset

	alias ProfessorStats.Models.Repo
	
	schema "leagues" do
		field :league_name, :string
    	has_many :scoring_settings, ProfessorStats.ScoringSetting
    	belongs_to :team, ProfessorStats.Team, foreign_key: :team_id

    	timestamps
	end 

	def with_scoring_settings(query) do
		from q in query, preload: [scoring_settings: :scoring_settings]
	end

	def get_for_team(team) do
		from l in ProfessorStats.League, where: ^team.id == l.team_id, select: l
	end

	@required_params ~w(league_name)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end
end