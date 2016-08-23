defmodule ProfessorStats.Web.TeamController do
  use ProfessorStats.Web.Web, :controller
  require Logger
  alias ProfessorStats.Models.Repo

  def index(conn, _params) do
    render conn, "index.html", teams: Repo.all(ProfessorStats.Team)
  end

  def show(conn, %{"id" => team_id}) do
  	team = Repo.preload(Repo.get!(ProfessorStats.Team, team_id), :team_players)
  	players = Enum.map(team.team_players, fn team_player -> Repo.preload(team_player, :player).player end)
    render conn, "show.html", team: team, players: players
  end

  def create(conn, params) do
  	changeset = ProfessorStats.Team.changeset(%ProfessorStats.Team{}, params)
  	case Repo.insert(changeset) do
  		{:ok, team} -> redirect conn, external: "/teams/#{team.id}"
  		{:error, stuff} -> 
  			Logger.info(inspect changeset)
  			redirect conn, external: "/teams"
  	end
  end

  def remove_player(conn, %{"team_id" => team_id, "player_id" => player_id}) do
  	team_players = Repo.delete_all(ProfessorStats.TeamPlayer.team_player_for(team_id,player_id))
  	redirect conn, external: "/teams/#{team_id}"
  end

end
