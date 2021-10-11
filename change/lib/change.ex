defmodule Change do
  @doc """
    Dynamic programming solution working with non-canonical coin denominations (to pass the following test):

    ```
    test "generates correct value for non-canonical coin systems" do
      change = %{1 => 0, 3 => 2, 4 => 0}
      assert Change.generate(6, [1, 3, 4]) == {:ok, change}
    end
    ```
    """
  def generate(_coins, amount) when amount < 0, do: {:error, "cannot change"}
  def generate([], _), do: {:ok, []}
  def generate(_, 0), do: {:ok, []}
  def generate(coins, amount) do
    base_ways(amount)
    |> get_best_ways(coins)
    |> result(amount)
  end

  defp base_ways(amount), do: for i <- 0..amount, do: if i == 0, do:  {:ok, []}, else: {:nok, []}

  defp get_best_ways(ways, coins) do
    Enum.with_index(ways)
    |> get_change(ways, coins)
  end

  defp get_change([{curr_way, amount} | idx_ways], ways, coins) when amount > 0 do
    new_ways = update_way(curr_way, amount, ways, coins)
    get_change(idx_ways, new_ways, coins)
  end
  defp get_change([_ | idx_ways], ways, coins), do: get_change(idx_ways, ways, coins)
  defp get_change(_, ways, _), do: ways

  defp update_way(curr_way, amount, ways, [coin | coins]) when amount >= coin do
    {:ok, prev_way} = Enum.fetch(ways, (amount-coin))

    new_way = if use_coin?(prev_way, coin) and compare(prev_way, curr_way) do
      collect_coin(prev_way, coin)
    else
      curr_way
    end

    new_ways = List.update_at(ways, amount, fn _ -> new_way end)

    update_way(new_way, amount, new_ways, coins)
  end
  defp update_way(_, _, ways, _), do: ways

  defp use_coin?({:ok, _}, _), do: true
  defp use_coin?({_, _}, _), do: false

  defp compare({:ok, p_way}, {:ok, way}), do: length(p_way) + 1 < length(way)
  defp compare(_, _), do: true

  defp collect_coin({_, way}, coin), do: {:ok, [coin | way]}

  defp result(ways, amount) do
    case Enum.fetch(ways, amount) do
      {:ok, {:ok,_} = res} -> res
      _ -> {:error, "cannot change"}
    end
  end
end
