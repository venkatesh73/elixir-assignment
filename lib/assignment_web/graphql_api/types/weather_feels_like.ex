defmodule AssignmentWeb.GraphqlApi.Types.WeatherFeelsLike do
  @moduledoc """
  Graphql Schema Types for WeatherFeelsLike
  """
  use Absinthe.Schema.Notation

  import Assignment.Helpers, only: [field_resolver: 1]

  object :weather_feels_like do
    field(:day, non_null(:float))
    field(:night, non_null(:float))
    field(:evening, non_null(:float), resolve: field_resolver(:eve))
    field(:morning, non_null(:float), resolve: field_resolver(:morn))
  end
end
