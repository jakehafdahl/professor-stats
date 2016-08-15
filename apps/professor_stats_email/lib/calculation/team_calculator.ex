defmodule ProfessorStats.TeamCalculator do
	alias ProfessorStats.WeeklyEmailBuilder
	alias ProfessorStats.WeeklyEmailSender
	alias ProfessorStats.Models.Repo

	def calculate_and_send(team, config) do
		# grab all players for that team and get their fantasy points
		[league | _] = Repo.all(ProfessorStats.League.get_for_team(team))
		scoring_settings = Repo.all(ProfessorStats.ScoringSetting.get_for_league(league))

		# fire off worker that calcs the fant points for the players on the team and orders them 
		# for start/sit stuff then fires off a message to a queue that gets processed sequentially
		{:ok, pid} = Task.start(fn -> 
			email_info = WeeklyEmailBuilder.build_email_info(team, scoring_settings, config)
			WeeklyEmailSender.send(email_info)
		end)
		pid
	end
end