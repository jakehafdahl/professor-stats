use Mix.Config

config :professor_stats_model, ProfessorStats.Model.Repo,
		adapter: Ecto.Adapters.MySQL,
		username: "root",
  		password: "abc.123",
		database: "professor_stats",
  		hostname: "localhost",
  		pool_size: 10