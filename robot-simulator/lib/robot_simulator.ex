defmodule North do
  defstruct name: :north, x: 0, y: 0
end

defmodule South do
  defstruct name: :south, x: 0, y: 0
end

defmodule East do
  defstruct name: :east, x: 0, y: 0
end

defmodule West do
  defstruct name: :west, x: 0, y: 0
end

defprotocol Robot do
  def move(robot, instruction)
  def get_direction(robot)
  def get_position(robot)
end


defimpl Robot, for: North do
  def move(robot, "A"), do: %{robot | y: robot.y + 1}
  def move(robot, "L"), do: %West{x: robot.x, y: robot.y}
  def move(robot, "R"), do: %East{x: robot.x, y: robot.y}
  def move(_robot, _), do: {:error, "invalid instruction"}

  def get_direction(robot), do: robot.name
  def get_position(robot), do: {robot.x, robot.y}
end


defimpl Robot, for: South do
  def move(robot, "A"), do: %{robot | y: robot.y - 1}
  def move(robot, "L"), do: %East{x: robot.x, y: robot.y}
  def move(robot, "R"), do: %West{x: robot.x, y: robot.y}
  def move(_robot, _), do: {:error, "invalid instruction"}

  def get_direction(robot), do: robot.name
  def get_position(robot), do: {robot.x, robot.y}
end


defimpl Robot, for: East do
  def move(robot, "A"), do: %{robot | x: robot.x + 1}
  def move(robot, "L"), do: %North{x: robot.x, y: robot.y}
  def move(robot, "R"), do: %South{x: robot.x, y: robot.y}
  def move(_robot, _), do: {:error, "invalid instruction"}

  def get_direction(robot), do: robot.name
  def get_position(robot), do: {robot.x, robot.y}
end


defimpl Robot, for: West do
  def move(robot, "A"), do: %{robot | x: robot.x - 1}
  def move(robot, "L"), do: %South{x: robot.x, y: robot.y}
  def move(robot, "R"), do: %North{x: robot.x, y: robot.y}
  def move(_robot, _), do: {:error, "invalid instruction"}

  def get_direction(robot), do: robot.name
  def get_position(robot), do: {robot.x, robot.y}
end

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

  defp do_create(direction, {x, y}) when is_number(x) and is_number(y) do
    case direction do
      :north -> %North{x: x, y: y}
      :south -> %South{x: x, y: y}
      :west -> %West{x: x, y: y}
      _ -> %East{x: x, y: y}
    end
  end
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

  defp do_move({:error, _} = robot, _), do: robot
  defp do_move(robot, [head | instructions]), do: do_move(Robot.move(robot, head), instructions)
  defp do_move(robot, []), do: robot
  defp do_move(_, _), do: {:error, "invalid instruction"}

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(nil), do: nil
  def direction(robot), do: Robot.get_direction(robot)

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot), do: Robot.get_position(robot)

  defp allowed_dir?(direction), do: Enum.find(@direction, fn x -> x == direction end) != nil
end
