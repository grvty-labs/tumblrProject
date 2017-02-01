defmodule Tumblr.Router do
  use Tumblr.Web, :router
  use ExAdmin.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tumblr do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/post", Tumblr do
    pipe_through :browser
    
    get "/testing/:id", PostController, :next
    resources "/", PostController
  end


  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes()
  end


  # Other scopes may use custom stacks.
  # scope "/api", Tumblr do
  #   pipe_through :api
  # end
end
