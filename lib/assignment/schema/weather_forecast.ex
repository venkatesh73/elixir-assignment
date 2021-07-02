defmodule Assignment.Schema.WeatherForeCast do
  @moduledoc """
  Weather forecast Schema
  """
  use Ecto.Schema

  import Assignment.Helpers
  import Ecto.Changeset

  alias Assignment.Schema.{WeatherDaily}

  @fields ~w(dt sunrise sunset temp feels_like)a

  @primary_key false
  embedded_schema do
    field :dt, :utc_datetime
    field :sunrise, :utc_datetime
    field :sunset, :utc_datetime
    field :temp, :float
    field :feels_like, :float

    embeds_many :daily, WeatherDaily
  end

  @spec changeset(map()) :: Ecto.Changeset.t()
  def changeset(params \\ %{}) do
    params = convert_dt_fields(params, [:dt, :sunrise, :sunset])

    %__MODULE__{}
    |> cast(params, @fields)
    |> cast_embed(:daily, required: true)
  end

  def new(params) do
    apply_action(changeset(params), :update)
  end
end
