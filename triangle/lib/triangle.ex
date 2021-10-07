defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) do
    check_positive(a, b, c)
    |> check(a, b, c)
    |> ret(a, b, c)
  end

  defp check_positive(a, b, c) when a > 0 and b > 0 and c > 0, do: :ok
  defp check_positive(_, _, _), do: :nok
  defp check(:ok, a, b, c) when a+b>=c and a+c>=b and b+c>=a, do: :ok
  defp check(:ok, _, _, _), do: :inequality
  defp check(:nok, _, _, _), do: :negative

  defp ret(:inequality, _, _, _), do: {:error, "side lengths violate triangle inequality"}
  defp ret(:negative, _, _, _), do: {:error, "all side lengths must be positive"}

  defp ret(:ok, a,a,a), do: {:ok, :equilateral}
  defp ret(:ok, a,a,_), do: {:ok, :isosceles}
  defp ret(:ok, a,_,a), do: {:ok, :isosceles}
  defp ret(:ok, _,b,b), do: {:ok, :isosceles}
  defp ret(:ok, _,_,_), do: {:ok, :scalene}

end
