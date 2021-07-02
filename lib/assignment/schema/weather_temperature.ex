defmodule Assignment.Schema.WeatherTemperature do
  @moduledoc """
  Weather forecast Schema for Temperature
  """
  use Ecto.Schema

  import Ecto.Changeset

  @fields ~w(day min max night eve morn)a

  @primary_key false
  embedded_schema do
    field :day, :float
    field :min, :float
    field :max, :float
    field :night, :float
    field :eve, :float
    field :morn, :float
  end

  def changeset(schema, params \\ %{}) do
    schema
    |> cast(params, @fields)
  end
end
