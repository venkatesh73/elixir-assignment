defmodule AssignmentWeb.GraphqlApi.Types.Weather do
  @moduledoc """
  Graphql Schema Types for Weather
  """
  use Absinthe.Schema.Notation

  object :weather do
    field(:main, non_null(:string))
    field(:description, non_null(:string))
  end
end
