defmodule ProfessorStats.Web.PageController do
  use ProfessorStats.Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
