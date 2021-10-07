defmodule SquareRoot do
  @doc """
  Calculate the integer square root of a positive integer
  """
  @spec calculate(radicand :: pos_integer) :: pos_integer
  def calculate(radicand) do
    random = random_number(radicand)
    sqrt(radicand, random)
  end

  defp sqrt(radicand, random) do
    res = (random + radicand/random)/2
    if (res*res) == radicand do
      res
    else
      sqrt(radicand, res)
    end
  end

  defp random_number(radicand), do: radicand / 2
end
