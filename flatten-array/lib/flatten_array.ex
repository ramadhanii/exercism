defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list), do: rec_list(list)

  defp rec_list(list, new_list \\ [])
  defp rec_list([head | list], new_list) when is_number(head), do: rec_list(list, new_list ++ [head])
  defp rec_list([head | list], new_list) when is_list(head), do: rec_list(head ++ list, new_list)
  defp rec_list([_ | list], new_list), do: rec_list(list, new_list)
  defp rec_list(_, new_list), do: new_list
end
