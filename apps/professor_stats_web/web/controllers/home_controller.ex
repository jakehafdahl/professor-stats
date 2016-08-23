defmodule ProfessorStats.Web.HomeController do
  use ProfessorStats.Web.Web, :controller
  alias ProfessorStats.Models.Repo

  def index(conn, _params) do
    render conn, "index.html", teams: Repo.all(ProfessorStats.Team)
  end

end
