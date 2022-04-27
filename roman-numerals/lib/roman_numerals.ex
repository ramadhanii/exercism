defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number), do: gen(number)

  defp gen(number, roman \\ "")
  defp gen(number, roman) when number >= 1000, do: gen(rem(number, 1000), concat(roman, "M", div(number, 1000)))
  defp gen(number, roman) when number >= 900 and number < 1000, do: gen(rem(number, 900), concat(roman, "CM", div(number, 900)+1))
  defp gen(number, roman) when number >= 500 and number < 900, do: gen(rem(number, 500), concat(roman, "D", div(number, 500)))
  defp gen(number, roman) when number >= 400 and number < 500, do: gen(rem(number, 400), concat(roman, "CD", div(number, 400)+1))
  defp gen(number, roman) when number >= 100 and number < 400, do: gen(rem(number, 100), concat(roman, "C", div(number, 100)))
  defp gen(number, roman) when number >= 90 and number < 100, do: gen(rem(number, 90), concat(roman, "XC", div(number, 90)+1))
  defp gen(number, roman) when number >= 50 and number < 90, do: gen(rem(number, 50), concat(roman, "L", div(number, 50)))
  defp gen(number, roman) when number >= 40 and number < 50, do: gen(rem(number, 40), concat(roman, "XL", div(number, 40)+1))
  defp gen(number, roman) when number >= 10 and number < 40, do: gen(rem(number, 10), concat(roman, "X", div(number, 10)))
  defp gen(number, roman) when number >= 9 and number < 10, do: gen(rem(number, 9), concat(roman, "IX", div(number, 9)+1))
  defp gen(number, roman) when number >= 5 and number < 9, do: gen(rem(number, 5), concat(roman, "V", div(number, 5)))
  defp gen(number, roman) when number >= 4 and number < 5, do: gen(rem(number, 4), concat(roman, "IV", div(number, 4)+1))
  defp gen(number, roman) when number >= 1 and number < 4, do: gen(rem(number, 1), concat(roman, "I", div(number, 1)))
  defp gen(_, roman), do: roman

  defp concat(roman, char, length), do: "#{roman}#{String.pad_trailing("", length, char)}"
end
