defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn candidate -> not equals?(base, candidate) and sort_listed(candidate) == sort_listed(base) end)
  end

  defp equals?(word1, word2) do
    case Regex.compile("^(#{word2})$", [:caseless]) do
      {:ok, regex} -> word1 =~ regex
      _ -> true
    end
  end

  defp sort_listed(word) do
    String.downcase(word)
    |> String.graphemes()
    |> Enum.sort()
  end
end
