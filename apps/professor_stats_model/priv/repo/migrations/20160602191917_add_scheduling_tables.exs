defmodule ProfessorStats.Repo.Migrations.AddSchedulingTables do
  use Ecto.Migration

  def change do
  	create table(:configs) do
  		  add :week, :integer
	  	  add :season_year, :integer
	  	  add :status, :string
		    add :run_date, :datetime

  		timestamps
  	end
  end

end
