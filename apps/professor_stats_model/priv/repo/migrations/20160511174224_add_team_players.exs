defmodule ProfessorStats.Repo.Migrations.AddTeamPlayers do
  use Ecto.Migration

  def change do

  		create table(:players) do
  			add :first_name, :string
  			add :last_name, :string
  			add :position, :string
  			add :team, :string

  			timestamps
  		end

  	  create table(:team_players) do
  			timestamps
  		end

      alter table(:team_players) do
        add :team_id, references(:teams)
        add :player_id, references(:players)
      end
  	end
end
