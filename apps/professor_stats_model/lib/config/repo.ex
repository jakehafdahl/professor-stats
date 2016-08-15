defmodule ProfessorStats.Models.Repo do
	use Ecto.Repo,
		otp_app: :professor_stats_model,
		adapter: Ecto.Adapters.MySQL
end