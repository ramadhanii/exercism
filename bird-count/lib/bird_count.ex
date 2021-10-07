defmodule BirdCount do
  def today(list) do
    # Please implement the today/1 function
    get_today(list)
  end

  defp get_today([]), do: nil
  defp get_today([head | _]), do: head

  def increment_day_count(list) do
    # Please implement the increment_day_count/1 function
    x = today(list)
    today = case x do
    nil -> 0
    _ -> x
    end
    inc(list, today)
  end

  defp inc([], _count), do: [1]
  defp inc([_head | tail], count), do: [count+1 | tail]

  def has_day_without_birds?(list) do
    # Please implement the has_day_without_birds?/1 function
    has_zero?(list)
  end

  defp has_zero?([]), do: false
  defp has_zero?([head | _]) when head === 0, do: true
  defp has_zero?([_ | tail]), do: has_zero?(tail)

  def total(list) do
    # Please implement the total/1 function
    sum(list)
  end

  defp sum(list, acc \\ 0)
  defp sum([], acc), do: acc
  defp sum([head | tail], acc), do: sum(tail, acc + head)

  def busy_days(list) do
    # Please implement the busy_days/1 function
    more_five?(list)
  end

  defp more_five?(list, count \\ 0)
  defp more_five?([head | tail], count) when head >= 5, do: more_five?(tail, count+1)
  defp more_five?([_ | tail], count), do: more_five?(tail, count)
  defp more_five?(_, count), do: count
end
