defmodule KitchenCalculator do
  def get_volume({_, size}) do
    # Please implement the get_volume/1 function
    size
  end

  def to_milliliter(volume_pair) do
    # Please implement the to_milliliter/1 functions
    to_mili(volume_pair)
  end

  defp to_mili({:cup, size}), do: {:milliliter, 240 * size}
  defp to_mili({:fluid_ounce, size}), do: {:milliliter, 30 * size}
  defp to_mili({:teaspoon, size}), do: {:milliliter, 5 * size}
  defp to_mili({:tablespoon, size}), do: {:milliliter, 15 * size}
  defp to_mili({_, size}), do: {:milliliter, size}

  def from_milliliter(volume_pair, unit) do
    # Please implement the from_milliliter/2 functions
    from_mili(volume_pair, unit)
  end

  defp from_mili({:milliliter, size}, :cup), do: {:cup, size / 240}
  defp from_mili({:milliliter, size}, :fluid_ounce), do: {:fluid_ounce, size / 30}
  defp from_mili({:milliliter, size}, :teaspoon), do: {:teaspoon, size / 5}
  defp from_mili({:milliliter, size}, :tablespoon), do: {:tablespoon, size / 15}
  defp from_mili({_, size}, :milliliter), do: {:milliliter, size}

  def convert(volume_pair, unit) do
    # Please implement the convert/2 function
    from_milliliter(to_milliliter(volume_pair), unit)
  end
end
