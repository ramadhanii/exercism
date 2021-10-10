defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.replace(string, ["-", "_"], " ")
    |> String.split()
    |> Enum.reduce("", fn word, acc -> acc <> String.first(word) end)
    |> String.upcase()
  end
end
