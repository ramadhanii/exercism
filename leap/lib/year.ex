defmodule Year do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  @spec leap_year?(non_neg_integer) :: boolean
  def leap_year?(year) do
    div4(year)
  end

  defp div4(year) when rem(year, 4) === 0, do: div100(year)
  defp div4(_), do: false

  defp div100(year) when rem(year, 100) === 0, do: div400(year)
  defp div100(_), do: true

  defp div400(year) when rem(year, 400) === 0, do: true
  defp div400(_), do: false
end
