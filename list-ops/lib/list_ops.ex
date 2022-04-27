defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(list, counter \\ 0)
  def count([_| tails], counter), do: count(tails, counter+1)
  def count(_, counter), do: counter

  @spec reverse(list) :: list
  def reverse(list), do: foldl(list, [], fn item, acc -> append([item], acc) end)

  @spec map(list, (any -> any)) :: list
  def map(list, f)
  def map([head | tails], f) when is_function(f), do: [ f.(head) | map(tails, f)]
  def map(_, _), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, f)
  def filter([head | tails], f) do
    if f.(head) do
      [head | filter(tails, f)]
    else
      filter(tails, f)
    end
  end
  def filter(_,_), do: []

  @type acc :: any
  @spec foldl(list, acc, (any, acc -> acc)) :: acc
  def foldl(l, acc, f)
  def foldl([head | tails], acc, f) when is_function(f), do: foldl(tails, f.(head, acc), f)
  def foldl(_, acc, _), do: acc

  @spec foldr(list, acc, (any, acc -> acc)) :: acc
  def foldr(l, acc, f), do: foldrr(reverse(l), acc, f)
  defp foldrr([head | tails], acc, f) when is_function(f), do: foldrr(tails, f.(head, acc), f)
  defp foldrr(_, acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b)
  def append([a|taila], b), do: [a | append(taila, b)]
  def append(_, b), do: b


  @spec concat([[any]]) :: [any]
  def concat(ll), do: foldl(ll, [], &(append(&2, &1)) )
end
