defmodule RobotSimulator do
  @direction [:north, :east, :south, :west]
  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction :: atom, position :: {integer, integer}) :: any
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, position) do
    if allowed_dir?(direction) do
      do_create(direction, position)
    else
      {:error, "invalid direction"}
    end
  end

  defp do_create(direction, {a, b} = position) when is_number(a) and is_number(b), do: {direction, position}
  defp do_create(_, {_, _}), do: {:error, "invalid position"}
  defp do_create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, instructions) do
    robot
    |> do_move(String.graphemes(instructions))
  end

  defp do_move(robot, ["A" | instructions]), do: do_move(go(robot), instructions)
  defp do_move(robot, ["R" = instruction | instructions]), do: do_move(get_direction(robot, instruction), instructions)
  defp do_move(robot, ["L" = instruction | instructions]), do: do_move(get_direction(robot, instruction), instructions)
  defp do_move(robot, []), do: robot
  defp do_move(_, _), do: {:error, "invalid instruction"}

  defp go(robot)
  defp go({:north = dir, {x, y}}), do: {dir, {x, y+1}}
  defp go({:south = dir, {x, y}}), do: {dir, {x, y-1}}
  defp go({:west = dir, {x, y}}), do: {dir, {x-1, y}}
  defp go({:east = dir, {x, y}}), do: {dir, {x+1, y}}

  defp get_direction(curr_dir, turn)
  defp get_direction({:north, position}, "L"), do: {:west, position}
  defp get_direction({:north, position}, "R"), do: {:east, position}
  defp get_direction({:south, position}, "L"), do: {:east, position}
  defp get_direction({:south, position}, "R"), do: {:west, position}
  defp get_direction({:east, position}, "L"), do: {:north, position}
  defp get_direction({:east, position}, "R"), do: {:south, position}
  defp get_direction({:west, position}, "L"), do: {:south, position}
  defp get_direction({:west, position}, "R"), do: {:north, position}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction({direction, _}), do: direction
  def direction(nil), do: nil

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position({direction, position}) do
    if Enum.find(@direction, fn x -> x == direction end) == nil do
      {:error, "invalid direction"}
    else
      position
    end
  end

  defp allowed_dir?(direction), do: Enum.find(@direction, fn x -> x == direction end) != nil
end
