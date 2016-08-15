defmodule ProfessorStats.WeeklyEmailBuilder do
	alias ProfessorStats.TeamPlayer
	alias ProfessorStats.Models.Repo
	alias ProfessorStats.Player
	alias ProfessorStats.PlayerProjection
	# fire off worker that calcs the fant points for the players on the team and orders them 
	# for start/sit stuff
	def build_email_info(team, settings, config) do
		player_info = players_for(team)
		|> Enum.map(fn player -> 
			score = settings
			|> Enum.filter(fn setting -> setting.position == player.position end)
			|> Enum.map(fn setting -> 
				Repo.all(PlayerProjection.get_for_player_and_week(player, config.week, config.season_year))
				|> Enum.map(fn projection -> PlayerProjection.apply_settings(projection,setting) end)
			end)
			|> Enum.reduce(&+/2)

			%{player: player, score: score}
		end)

		%{team: team, player_info: player_info}
	end	

	def players_for(team) do
		team_players = Repo.all(TeamPlayer.team_players_for(team))

		players = team_players |> Enum.map(fn team_player -> Repo.preload(team_player, :player).player end)
	end
end