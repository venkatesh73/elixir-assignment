defmodule AssignmentWeb.GraphqlApi.Schema do
  @moduledoc """
  Graphql API Schema
  """
  use Absinthe.Schema

  alias AssignmentWeb.GraphqlApi.Resolvers

  import_types(AssignmentWeb.GraphqlApi.Types)

  query do
    field :weather_forecast, non_null(:weather_forecast) do
      arg(:input, non_null(:coordinate_inputs))

      resolve(&Resolvers.get/3)
    end
  end
end
