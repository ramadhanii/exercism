defmodule Lasagna do

  # TODO: define the 'expected_minutes_in_oven/0' function
  def expected_minutes_in_oven() do
    40
  end

  # TODO: define the 'remaining_minutes_in_oven/1' function
  def remaining_minutes_in_oven(current_minutes) do
    expected_minutes_in_oven() - current_minutes
  end

  # TODO: define the 'preparation_time_in_minutes/1' function
  def preparation_time_in_minutes(layers) do
    layers * 2
  end

  # TODO: define the 'total_time_in_minutes/2' function
  def total_time_in_minutes(num_of_layer, current_minutes) do
    current_minutes + preparation_time_in_minutes(num_of_layer)
  end

  # TODO: define the 'alarm/0' function
  def alarm() do
    "Ding!"
  end
end
