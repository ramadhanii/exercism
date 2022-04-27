defmodule Raindrops do
  @sound %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }
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
    Enum.reduce([3, 5, 7], "", fn x, acc -> acc <> con(number, x) end)
    |> result(number)
  end

  defp con(number, prime_factor) when rem(number, prime_factor) === 0, do: Map.get(@sound, prime_factor)
  defp con(_, _), do: ""

  defp result(sound, number) when sound == "", do: "#{number}"
  defp result(sound, _), do: sound
end
