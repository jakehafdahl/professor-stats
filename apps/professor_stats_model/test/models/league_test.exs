defmodule ProfessorStats.LeagueTest do
	use ExUnit.Case

	alias ProfessorStats.League

	test "required fields (league_name)" do
		league_changeset = League.changeset(%League{}, %{})

		assert [league_name: "can't be blank"] = league_changeset.errors
	end
end