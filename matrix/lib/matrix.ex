defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    String.split(input, "\n")
    |> Enum.map(&(String.split/1))
    |> parse_int()
  end

  defp parse_int(list) do
    for rows <- list do
      parse_int_col(rows)
    end
  end

  defp parse_int_col(rows) do
    for col <- rows do
      String.to_integer(col)
    end
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    Enum.reduce(matrix, [], fn x, acc -> acc ++ [Enum.join(x, " ")] end)
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix), do: matrix

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    case Enum.fetch(matrix, index-1) do
      {:ok, row} -> row
      _ -> nil
    end
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    matrix
    |> transpose()
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    case Enum.fetch(columns(matrix), index-1) do
      {:ok, row} -> row
      _ -> nil
    end
  end

  def transpose(matrix) do
    matrix
    |> List.zip()
    |> Enum.map(&(Tuple.to_list/1))
  end
end
