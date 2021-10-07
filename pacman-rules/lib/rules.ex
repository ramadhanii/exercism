defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    # Please implement the eat_ghost?/2 function
    power_pellet_active and touching_ghost
  end

  def score?(touching_power_pellet, touching_dot) do
    # Please implement the score?/2 function
    touching_power_pellet or touching_dot
  end

  def lose?(power_pellet_active, touching_ghost) do
    # Please implement the lose?/2 function
    touching_while_doesn_have_pellet(power_pellet_active, touching_ghost)
  end

  defp touching_while_doesn_have_pellet(false, true), do: true
  defp touching_while_doesn_have_pellet(_, _), do: false

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    # Please implement the win?/3 function
    has_eaten_all_dots and not lose?(power_pellet_active, touching_ghost)
  end
end
