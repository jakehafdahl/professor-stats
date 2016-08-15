defmodule ProfessorStats.TeamTest do
	use ExUnit.Case

	alias ProfessorStats.Team

	test "invalid team email fails" do
		team_changeset = Team.changeset(%Team{}, %{team_name: "test", email: "test"})

		assert [email: "has invalid format"] = team_changeset.errors
	end

	test "required fields missing fails" do
		nameless_team_changeset = Team.changeset(%Team{}, %{email: "test@test.com"})

		assert [team_name: "can't be blank"] = nameless_team_changeset.errors

		emailless_team_changeset = Team.changeset(%Team{}, %{team_name: "test"})

		assert [email: "can't be blank"] = emailless_team_changeset.errors
	end

	test "valid team has no errors" do
		nameless_team_changeset = Team.changeset(%Team{}, %{team_name: "test", email: "test@test.com"})

		assert [] = nameless_team_changeset.errors
	end
end