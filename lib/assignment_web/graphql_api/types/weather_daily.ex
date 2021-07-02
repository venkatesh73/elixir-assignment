defmodule AssignmentWeb.GraphqlApi.Types.WeatherDaily do
  @moduledoc """
  Graphql Schema Types for WeatherDaily
  """
  use Absinthe.Schema.Notation

  import_types AssignmentWeb.GraphqlApi.Types.Weather
  import_types AssignmentWeb.GraphqlApi.Types.WeatherFeelsLike
  import_types AssignmentWeb.GraphqlApi.Types.WeatherTemperature

  import Assignment.Helpers, only: [field_resolver: 1]

  object :weather_daily do
    field(:date, non_null(:datetime), resolve: field_resolver(:dt))
    field(:pressure, non_null(:string))
    field(:humidity, non_null(:string))
    field(:temperature, non_null(:weather_temperature), resolve: field_resolver(:temp))
    field(:feels_like, non_null(:weather_feels_like))
    field(:weather, non_null(list_of(:weather)))
  end
end
