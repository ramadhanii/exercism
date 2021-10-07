defmodule ResistorColorTrio do
  @dict %{
    :black => 0,
    :brown => 1,
    :red => 2,
    :orange => 3,
    :yellow => 4,
    :green => 5,
    :blue => 6,
    :violet => 7,
    :grey => 8,
    :white => 9
  }

  @doc """
  Calculate the resistance value in ohm or kiloohm from resistor colors
  """
  @spec label(colors :: [atom]) :: {integer, :ohms | :kiloohms}
  def label([color1, color2, color3]) do
    str = "#{Map.get(@dict, color1)}#{Map.get(@dict, color2)}"
    len = (String.length(str)+Map.get(@dict, color3))

    String.pad_trailing(str, len, "0")
    |> String.to_integer()
    |> ohm_or_kiloohm()
  end

  defp ohm_or_kiloohm(num) when num > 1000, do: {div(num, 1000), :kiloohms}
  defp ohm_or_kiloohm(num), do: {num, :ohms}
end
