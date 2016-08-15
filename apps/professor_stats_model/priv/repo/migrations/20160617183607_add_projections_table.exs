defmodule ProfessorStats.Repo.Migrations.AddProjectionsTable do
  use Ecto.Migration

  def change do
  	create table(:player_projections) do
  		add :week, :integer
	  	add :season_year, :integer
		  add :rush_yards, :integer
		  
	  	add :player_id, references(:players)

  		timestamps
  	end
  end

end
