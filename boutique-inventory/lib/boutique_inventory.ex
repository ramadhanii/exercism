defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    # Please implement the sort_by_price/1 function
    Enum.sort_by(inventory, &(&1.price), :asc)
  end

  def with_missing_price(inventory) do
    # Please implement the with_missing_price/1 function
    Enum.filter(inventory, fn el -> is_nil(el.price) end)
  end

  def increase_quantity(item, count) do
    if Enum.empty?(item.quantity_by_size) do
      item
    else
      %{item | quantity_by_size: Enum.reduce(item.quantity_by_size, %{}, fn {k, v}, new_struct ->
        Map.put(new_struct, k, v+count) end)}
    end
  end

  def total_quantity(item) do
    if Enum.empty?(item.quantity_by_size) do
      0
    else
      Enum.reduce(item.quantity_by_size, 0, fn {_, v}, acc -> acc+v end)
    end
  end
end
