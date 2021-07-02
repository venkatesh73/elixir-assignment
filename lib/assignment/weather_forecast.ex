defmodule Assignment.WeatherForecast do
  @moduledoc """
  WeatherForecast context
  """
  use Tesla

  alias Assignment.Schema.WeatherForeCast

  plug Tesla.Middleware.JSON

  @weather_config Application.get_env(:assignment, WeatherForecast)
  @api_url Keyword.fetch!(@weather_config, :url)
  @api_key Keyword.fetch!(@weather_config, :api_key)

  def get(lat, lon) do
    with {:ok, response} <-
           get(@api_url, query: [lat: lat, lon: lon, exclude: "hourly", appid: @api_key]),
         %{"current" => current, "daily" => daily} <- response.body,
         forecast <- Map.put(current, "daily", daily),
         {:ok, weather_forecast} <- WeatherForeCast.new(forecast) do
      weather_forecast
    else
      {:error, _} ->
        "Failed to fetch Weather API"

      %{"cod" => "400", "message" => "Nothing to geocode"} ->
        "Invalid GeoCode Provided"
    end
  end

  def test() do
    %{message: "I am test API"}
  end
end
