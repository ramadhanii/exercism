defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    gen(number)
  end

  defp gen(number, roman \\ "")
  defp gen(number, roman) when number >= 1000 do
    div = div(number, 1000)
    gen(rem(number, 1000), "#{roman}#{String.pad_trailing("", div, "M")}")
  end
  defp gen(number, roman) when number >= 900 and number < 1000 do
    div = div(number, 900)
    gen(rem(number, 900), "#{roman}#{String.pad_trailing("", div+1, "CM")}")
  end
  defp gen(number, roman) when number >= 500 and number < 900 do
    div = div(number, 500)
    gen(rem(number, 500), "#{roman}#{String.pad_trailing("", div, "D")}")
  end
  defp gen(number, roman) when number >= 400 and number < 500 do
    div = div(number, 400)
    gen(rem(number, 400), "#{roman}#{String.pad_trailing("", div+1, "CD")}")
  end
  defp gen(number, roman) when number >= 100 and number < 400 do
    div = div(number, 100)
    gen(rem(number, 100), "#{roman}#{String.pad_trailing("", div, "C")}")
  end
  defp gen(number, roman) when number >= 90 and number < 100 do
    div = div(number, 90)
    gen(rem(number, 90), "#{roman}#{String.pad_trailing("", div+1, "XC")}")
  end
  defp gen(number, roman) when number >= 50 and number < 90 do
    div = div(number, 50)
    gen(rem(number, 50), "#{roman}#{String.pad_trailing("", div, "L")}")
  end
  defp gen(number, roman) when number >= 40 and number < 50 do
    div = div(number, 40)
    gen(rem(number, 40), "#{roman}#{String.pad_trailing("", div+1, "XL")}")
  end
  defp gen(number, roman) when number >= 10 and number < 40 do
    div = div(number, 10)
    gen(rem(number, 10), "#{roman}#{String.pad_trailing("", div, "X")}")
  end
  defp gen(number, roman) when number >= 9 and number < 10 do
    div = div(number, 9)
    gen(rem(number, 9), "#{roman}#{String.pad_trailing("", div+1, "IX")}")
  end
  defp gen(number, roman) when number >= 5 and number < 9 do
    div = div(number, 5)
    gen(rem(number, 5), "#{roman}#{String.pad_trailing("", div, "V")}")
  end
  defp gen(number, roman) when number >= 4 and number < 5 do
    div = div(number, 4)
    gen(rem(number, 4), "#{roman}#{String.pad_trailing("", div+1, "IV")}")
  end
  defp gen(number, roman) when number >= 1 and number < 4 do
    div = div(number, 1)
    gen(rem(number, 1), "#{roman}#{String.pad_trailing("", div, "I")}")
  end
  defp gen(_, roman), do: roman
end
