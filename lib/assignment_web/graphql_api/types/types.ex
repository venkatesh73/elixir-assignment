defmodule AssignmentWeb.GraphqlApi.Types do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)
  import_types(AssignmentWeb.GraphqlApi.Types.CoordinateInput)
  import_types(AssignmentWeb.GraphqlApi.Types.WeatherForecast)
end
