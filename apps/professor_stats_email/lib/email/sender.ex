defmodule ProfessorStats.WeeklyEmailSender do
	require EEx

	EEx.function_from_file :def, :from_template, "lib/email/email_template.eex", [:email_info]

	def send(email_info) do
		# pass email info into a template to let that do the email building
		# for now just write the email info to a file
		content = ProfessorStats.WeeklyEmailSender.from_template(email_info)
		File.write!("#{email_info.team.team_name}.html", content)
	end
end