defmodule Assignment.Schema.Weather do
  @moduledoc """
  Weather Schema
  """
  use Ecto.Schema

  import Ecto.Changeset

  @primary_key false
  embedded_schema do
    field :main, :string
    field :description, :string
  end

  def changeset(schema, params \\ %{}) do
    schema
    |> cast(params, [:main, :description])
  end
end
