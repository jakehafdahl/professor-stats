defmodule ProfessorStats.Web.Router do
  use ProfessorStats.Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ProfessorStats.Web do
    pipe_through :browser # Use the default browser stack

    get "/", HomeController, :index

    resources "/teams", TeamController
    get "/teams/:team_id/remove/:player_id", TeamController, :remove_player
  end

  # Other scopes may use custom stacks.
  # scope "/api", ProfessorStats.Web do
  #   pipe_through :api
  # end
end
