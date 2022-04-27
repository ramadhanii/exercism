defimpl String.Chars, for: Clock do
    def to_string(clock), do: Clock.to_string(clock)
end

defmodule Clock do
  defstruct hour: 0, minute: 0

  @doc """
  Returns a clock that can be represented as a string:

      iex> Clock.new(8, 9) |> to_string
      "08:09"
  """
  @spec new(integer, integer) :: Clock
  def new(hour, minute) do
    hour_changer = get_hour_change(minute)
    %Clock{hour: (hour + hour_changer) |> format_hour(), minute: minute |> format_minute()}
  end

  defp get_hour_change(minute) do
    new_minute = div(minute, 60)
    cond do
      minute < 0 and rem(minute, 60) != 0 -> new_minute - 1
      true -> new_minute
    end
  end

  defp format_hour(hour) when abs(hour) > 23, do: format_hour(rem(hour, 24))
  defp format_hour(hour) do
    cond do
      hour < 0 -> 24 + hour
      true -> hour
    end
  end

  defp format_minute(minute) when abs(minute) > 59, do: format_minute(rem(minute, 60))
  defp format_minute(minute) do
    cond do
      minute < 0 -> 60 + minute
      true -> minute
    end
  end

  @doc """
  Adds two clock times:

      iex> Clock.new(10, 0) |> Clock.add(3) |> to_string
      "10:03"
  """
  @spec add(Clock, integer) :: Clock
  def add(%Clock{hour: hour, minute: minute}, add_minute) do
    new_minute = minute + add_minute
    hour_changer = get_hour_change(new_minute)
    %Clock{hour: (hour + hour_changer) |> format_hour(), minute: new_minute |> format_minute()}
  end

  def to_string(clock) do
    hour = "0#{clock.hour}"
    minute = "0#{clock.minute}"
    "#{String.slice(hour, -2..-1)}:#{String.slice(minute, -2..-1)}"
  end
end
