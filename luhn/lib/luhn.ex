defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number) do
    String.trim(number)
    |> only_number_or_space?()
    |> length_valid?()
    |> div_by_ten?()
    |> result()
  end

  defp only_number_or_space?(number), do: if Regex.match?(~r/^([0-9\s]{2,})*$/, number), do: {:ok, number}, else: {:nok, number}

  defp length_valid?({:ok, number}) when length(number) <= 1, do: {:nok, number}
  defp length_valid?(res), do: res

  defp div_by_ten?({:ok, number}) do
    String.replace(number, " ", "")
    |> String.reverse()
    |> String.graphemes()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {x, i}, acc -> double_digit(i, String.to_integer(x)) + acc end)
    |> divide_ten(number)
  end
  defp div_by_ten?(res), do: res

  defp double_digit(i, x) do
    if rem(i, 2) != 0 do
      if x * 2 > 9, do: (x * 2) - 9, else: x*2
    else
      x
    end
  end

  defp divide_ten(total, number) when rem(total, 10) === 0, do: {:ok, number}
  defp divide_ten(_, number), do: {:nok, number}

  defp result({:ok, _}), do: true
  defp result({:nok, _}), do: false
end
