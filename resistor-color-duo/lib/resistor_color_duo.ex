defmodule ResistorColorDuo do
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
  Calculate a resistance value from two colors
  """
  @spec value(colors :: [atom]) :: integer
  def value([color1, color2 | _]) do
    "#{Map.get(@dict, color1)}#{Map.get(@dict, color2)}"
    |> String.to_integer()
  end
end
