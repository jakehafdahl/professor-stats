defmodule ProfessorStats.ScheduleConfig do
	use Ecto.Schema
	import Ecto.Query
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

	def waiting_configs(date) do
		from sc in ProfessorStats.ScheduleConfig,
			where: sc.run_date < ^date and sc.status == "WAITING",
			select: sc
	end
end