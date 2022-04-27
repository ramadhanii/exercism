defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    str_list = replaceSpecialChar(sentence)
                |> cleanMultipleSpace()
                |> String.split(~r/([\s|\n|\t|_])/)
                |> Enum.map(fn x -> String.trim(String.downcase(x), "'") end)

    Enum.reduce(str_list, %{}, fn x, new_struct -> Map.put(new_struct, x, Enum.count(str_list, fn xx -> xx == x end)) end)
  end

  @doc """
  Replace special characters with space
  """
  @spec replaceSpecialChar(String.t()) :: String.t()
  def replaceSpecialChar(sentence), do: Regex.replace(~r/[!#$%&()*+,.:;<=>?@\^_`{|}~]/, sentence, " ")

  @doc """
  Clean double space
  """
  @spec cleanMultipleSpace(String.t()) :: String.t()
  def cleanMultipleSpace(sentence), do: Regex.replace(~r/\s+/, String.trim(sentence), " ")
end
