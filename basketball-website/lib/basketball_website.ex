defmodule BasketballWebsite do
  def extract_from_path(data, path) do
    # Please implement the extract_from_path/2 function
    extract(data, String.split(path, "."))
  end

  defp extract(data, path_list)
  defp extract(data, []), do: data
  defp extract(data, [head | tail]), do: extract(data[head], tail)

  def get_in_path(data, path) do
    # Please implement the get_in_path/2 function
    get_in(data, String.split(path, "."))
  end
end
