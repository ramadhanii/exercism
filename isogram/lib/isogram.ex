defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    String.downcase(sentence)
    |> String.split()
    |> Enum.map(&String.graphemes/1)
    |> Enum.reduce(false, fn x, status -> repeat?(x) or status end)
    |> negasi()
  end

  defp negasi(res), do: not res

  def repeat?(charlist) do
    Enum.reduce(charlist, false, fn x, status -> length(Enum.filter(charlist, &(&1 == x and &1 != "-")))>1 or status end)
  end

end
