defmodule AssignmentWeb.GraphqlApi.Types.WeatherForecast do
  @moduledoc """
  Graphql Schema Types for Weather Forecast
  """
  use Absinthe.Schema.Notation

  import_types AssignmentWeb.GraphqlApi.Types.WeatherDaily

  import Assignment.Helpers, only: [field_resolver: 1]

  object :weather_forecast do
    field(:date, non_null(:datetime), resolve: field_resolver(:dt))
    field(:sunrise, non_null(:datetime))
    field(:sunset, non_null(:datetime))
    field(:temperature, non_null(:float), resolve: field_resolver(:temp))
    field(:feels_like, non_null(:float))
    field(:daily, non_null(list_of(:weather_daily)))
  end
end
