defmodule CollatzConjecture do
  @moduledoc """
  Work on exercism CollatzConjecture module
  """
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input, step \\ 0)
  def calc(input, step) when input == 1, do: step
  def calc(input, step) when input > 1 and is_number(input) and rem(input, 2) === 0, do: calc(div(input, 2), step+1)
  def calc(input, step) when input > 1 and is_number(input), do: calc((input*3)+1, step+1)
end