defmodule AssignmentWeb.GraphqlApi.Types.CoordinateInput do
  use Absinthe.Schema.Notation

  input_object :coordinate_inputs do
    field(:latitude, non_null(:string))
    field(:longitude, non_null(:string))
  end
end
