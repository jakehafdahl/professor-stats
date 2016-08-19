defmodule ProfessorStats.Team do
	use Ecto.Schema
	import Ecto.Query
	import Ecto.Changeset
	
	alias ProfessorStats.Models.Repo

	schema "teams" do
		field :team_name, :string
  		field :email, :string
    	has_one :league, ProfessorStats.League
    	has_many :team_players, ProfessorStats.TeamPlayer

    	timestamps
	end 

	def with_players do
		from q in ProfessorStats.TeamPlayer, preload: [team_players: :team_players]
	end

	@required_params ~w(team_name email)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
		|> validate_format(:email, ~r/@/)
		|> unique_constraint(:email)
	end
end