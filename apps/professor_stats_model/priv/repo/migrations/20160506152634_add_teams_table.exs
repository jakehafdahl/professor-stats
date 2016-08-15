defmodule ProfessorStats.Repo.Migrations.AddTeamsTable do
  use Ecto.Migration

  def change do
  	create table(:teams) do
  		add :team_name, :string
  		add :email, :string

  		timestamps
  	end

  	create table(:leagues) do
  		add :league_name, :string

  		timestamps
  	end

  	create table(:scoring_settings) do
  		add :position, :string
  		add :field, :string
  		add :points_for, :integer
  		add :required_per, :integer

  		timestamps
  	end

    alter table(:leagues) do
      add :team_id, references(:teams)
    end

  	alter table(:scoring_settings) do
  		add :league_id, references(:leagues)
  	end
  end
end
