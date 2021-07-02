defmodule AssignmentWeb.Router do
  use AssignmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AssignmentWeb.GraphqlApi.Schema,
      interface: :simple

    forward "/", Absinthe.Plug,
      schema: AssignmentWeb.GraphqlApi.Schema
  end
end
