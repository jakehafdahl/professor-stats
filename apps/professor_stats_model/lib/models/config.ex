defmodule ProfessorStats.ScheduleConfig do
	use Ecto.Model
	import Ecto.Changeset

	schema "configs" do
  		field :week, :integer
  		field :season_year, :integer
  		field :status, :string, default: "WAITING"
  		field :run_date, Ecto.DateTime

  		timestamps
	end 

	@required_params ~w(week season_year status run_date)
	@optional_params ~w()

	def changeset(model, params \\ :empty) do
		model
		|> cast(params, @required_params, @optional_params)
	end
end