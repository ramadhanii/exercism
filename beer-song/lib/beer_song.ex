defmodule StringHelper do
  def bootle_pluralization(number) do
    cond do
      number > 1 -> "#{number} bottles"
      number == 1 -> "1 bottle"
      number == 0 -> "no more bottles"
    end
  end
end

defmodule BeerSong do
  defp first_verse(number), do: "#{String.capitalize(StringHelper.bootle_pluralization(number))} of beer on the wall, #{StringHelper.bootle_pluralization(number)} of beer."
  defp second_verse(number) do
    cond do
      number > 1 -> "Take one down and pass it around, #{String.capitalize(StringHelper.bootle_pluralization(number-1))} of beer on the wall."
      number == 1 -> "Take it down and pass it around, no more bottles of beer on the wall."
      number == 0 -> "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end

  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{first_verse(number)}
    #{second_verse(number)}
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map(range, fn number -> "#{verse(number)}" end)
    |> Enum.join("\n")
  end

end
