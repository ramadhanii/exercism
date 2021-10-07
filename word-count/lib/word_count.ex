defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence = Regex.replace(~r/[!#$%&()*+,.:;<=>?@\^_`{|}~]/, sentence, " ")
    str_list = Regex.replace(~r/\s+/, String.trim(sentence), " ") |> String.split(~r/([\s|\n|\t|_])/)
    |> Enum.map(fn x -> String.trim(String.downcase(x), "'") end)

    Enum.reduce(str_list, %{}, fn x, new_struct -> Map.put(new_struct, x, Enum.count(str_list, fn xx -> xx == x end)) end)
  end
end
