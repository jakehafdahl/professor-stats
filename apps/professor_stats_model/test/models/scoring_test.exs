defmodule ProfessorStats.ScoringTest do
	use ExUnit.Case

	alias ProfessorStats.ScoringSetting

	test "required fields (position)" do
		scoring_changeset = ScoringSetting.changeset(%ScoringSetting{}, %{field: "rushyards", points_for: 1, required_per: 10})

		assert [position: "can't be blank"] = scoring_changeset.errors
	end

	test "required fields (field)" do
		scoring_changeset = ScoringSetting.changeset(%ScoringSetting{}, %{position: "RB", points_for: 1, required_per: 10})

		assert [field: "can't be blank"] = scoring_changeset.errors
	end

	test "required fields (points_for)" do
		scoring_changeset = ScoringSetting.changeset(%ScoringSetting{}, %{position: "RB", field: "rushyards", required_per: 10})

		assert [points_for: "can't be blank"] = scoring_changeset.errors
	end

	test "required fields (required_per)" do
		scoring_changeset = ScoringSetting.changeset(%ScoringSetting{}, %{position: "RB", field: "rushyards", points_for: 1})

		assert [required_per: "can't be blank"] = scoring_changeset.errors
	end
end