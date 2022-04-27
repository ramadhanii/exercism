defmodule Bob do

  defp only_numbers?(input), do: Regex.match?(~r/^[0-9, :\)\?]*$/, input)
  defp is_upcase?(input), do: input == String.upcase(input)
  defp is_question?(input), do: String.ends_with?(String.trim(input), "?")

  @spec hey(String.t()) :: String.t()
  def hey(input) do
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      not only_numbers?(input) and is_upcase?(input) and is_question?(input) -> "Calm down, I know what I'm doing!"
      not only_numbers?(input) and is_upcase?(input) -> "Whoa, chill out!"
      is_question?(input) -> "Sure."
      true -> "Whatever."
    end
  end
end
