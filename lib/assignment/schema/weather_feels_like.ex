defmodule Assignment.Schema.WeatherFeelsLike do
  @moduledoc """
  Weather forecasts Schema for feels like
  """
  use Ecto.Schema

  import Ecto.Changeset

  @fields ~w(day night eve morn)a

  @primary_key false
  embedded_schema do
    field :day, :float
    field :night, :float
    field :eve, :float
    field :morn, :float
  end

  def changeset(schema, params \\ %{}) do
    schema
    |> cast(params, @fields)
  end
end
