defmodule Assignment.Schema.WeatherDaily do
  @moduledoc """
  Weather forecast schema for Daily weather
  """
  use Ecto.Schema

  import Assignment.Helpers
  import Ecto.Changeset

  alias Assignment.Schema.{Weather, WeatherFeelsLike, WeatherTemperature}

  @primary_key false
  embedded_schema do
    field :dt, :utc_datetime
    field :pressure, :float
    field :humidity, :float

    embeds_one :temp, WeatherTemperature
    embeds_one :feels_like, WeatherFeelsLike
    embeds_many :weather, Weather
  end

  def changeset(schema, params \\ %{}) do
    params = convert_dt_fields(params, [:dt])

    schema
    |> cast(params, [:dt, :pressure, :humidity])
    |> cast_embed(:temp, required: true)
    |> cast_embed(:weather, required: true)
    |> cast_embed(:feels_like, required: true)
  end
end
