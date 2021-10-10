defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    options = case Keyword.has_key?(options, :maximum_price) do
      true -> options
      _ -> Keyword.put(options, :maximum_price, 100.00)
    end
    tops
    |> cross_list(bottoms)
    |> filter_color()
    |> filter(options)
    |> get_item()
  end

  defp cross_list(tops, bottoms) do
    for t <- tops, b <- bottoms do
      total_price = t.price + b.price
      %{:item=> {t, b}, :total_price=> total_price}
    end
  end

  defp filter_color(list) do
    for item <- list, not color_same?(item) do
      item
    end
  end
  defp color_same?(%{:item=> {%{:base_color=> bsc},%{:base_color=> bsc}}}), do: true
  defp color_same?(_), do: false

  defp filter(list, [{:maximum_price, value}| tails]) do
    filter_max_price(list, value)
    |> filter(tails)
  end
  defp filter(list, _), do: list

  defp filter_max_price(items, value), do: for item <- items, item.total_price <= value, do: item

  defp get_item(list), do: for l <- list, do: l.item
end
