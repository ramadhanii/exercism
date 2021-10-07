defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    sound = Enum.reduce([3, 5, 7], "", fn x, acc -> acc <> con(number, x) end)
    if sound == "", do: "#{number}", else: sound
  end

  defp con(number, prime_factor) when prime_factor === 3 and rem(number, 3) === 0, do: "Pling"
  defp con(number, prime_factor) when prime_factor === 5 and rem(number, 5) === 0, do: "Plang"
  defp con(number, prime_factor) when prime_factor === 7 and rem(number, 7) === 0, do: "Plong"
  defp con(_, _), do: ""
end
