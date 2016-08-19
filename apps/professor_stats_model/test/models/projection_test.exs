defmodule ProfessorStats.PlayerProjectionTest do
	use ExUnit.Case

	alias ProfessorStats.PlayerProjection

	test "required fields missing fails" do
		missing_week_changeset = PlayerProjection.changeset(%PlayerProjection{}, %{season_year: 2016, player_id: 1 })

		assert [week: {"can't be blank", []}] = missing_week_changeset.errors

		missing_season_year_changeset = PlayerProjection.changeset(%PlayerProjection{}, %{week: 1, player_id: 1 })

		assert [season_year: {"can't be blank", []}] = missing_season_year_changeset.errors

		missing_player_id_changeset = PlayerProjection.changeset(%PlayerProjection{}, %{season_year: 2016, week: 1 })

		assert [player_id: {"can't be blank", []}] = missing_player_id_changeset.errors
	end

	test "valid player projection has no errors" do
		valid_changeset = PlayerProjection.changeset(%PlayerProjection{}, %{season_year: 2016, week: 1, player_id: 1 })

		assert [] = valid_changeset.errors
	end
end