defmodule AssignmentWeb.GraphqlApi.Resolvers do
  @moduledoc """
  """
  alias Assignment.WeatherForecast

  def get(_root, %{input: %{latitude: lat, longitude: lon}}, _info) do
    {:ok, WeatherForecast.get(lat, lon)}
  end
end
