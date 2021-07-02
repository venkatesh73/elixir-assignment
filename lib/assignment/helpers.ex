defmodule Assignment.Helpers do
  @moduledoc """
  Helpers functions
  """

  def convert_dt_fields(params, fields) do
    Enum.reduce(fields, params, fn field, params ->
      Map.update!(params, to_string(field), fn unix ->
        {:ok, date_time} = DateTime.from_unix(unix)
        date_time
      end)
    end)
  end

  def field_resolver(key) do
    fn parent, _, _ -> {:ok, Map.get(parent, key)} end
  end
end
