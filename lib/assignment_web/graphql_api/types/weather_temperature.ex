defmodule AssignmentWeb.GraphqlApi.Types.WeatherTemperature do
  @moduledoc """
  Graphql Schema Types for WeatherTemperature
  """
  use Absinthe.Schema.Notation

  import Assignment.Helpers, only: [field_resolver: 1]

  object :weather_temperature do
    field(:day, :float)
    field(:min, non_null(:float))
    field(:max, non_null(:float))
    field(:evening, non_null(:float), resolve: field_resolver(:eve))
    field(:morning, non_null(:float), resolve: field_resolver(:morn))
    field(:night, non_null(:float))
  end
end
