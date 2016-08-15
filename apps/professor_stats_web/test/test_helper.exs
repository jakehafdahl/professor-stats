ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ProfessorStats.Web.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ProfessorStats.Web.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ProfessorStats.Web.Repo)

