defmodule Transpose do
  @doc """
  Given an input text, output it transposed.

  Rows become columns and columns become rows. See https://en.wikipedia.org/wiki/Transpose.

  If the input has rows of different lengths, this is to be solved as follows:
    * Pad to the left with spaces.
    * Don't pad to the right.

  ## Examples

    iex> Transpose.transpose("ABC\\nDE")
    "AD\\nBE\\nC"

    iex> Transpose.transpose("AB\\nDEF")
    "AD\\nBE\\n F"
  """

  @spec transpose(String.t()) :: String.t()
  def transpose(input) when input == "", do: input
  def transpose(input) do
    list = tolist(input)
    length = get_max_length(list)

    equalize(list, length)
    |> do_transpose(length)
    |> tostring()
  end

  defp equalize(list, length) do
    Enum.map(list, fn x -> x ++ List.duplicate("|", length - length(x))end)
  end

  defp tolist(input) do
    String.split(input, "\n")
    |> Enum.map(&(String.graphemes/1))
  end

  def do_transpose(matrix, length) do
    for i <- 0..(length-1) do
      for rows <- matrix, res = Enum.fetch(rows, i) do
        if res != :error do
          {:ok, char} = res
          char
        end
      end
    end
  end

  defp get_max_length(matrix) do
    Enum.sort_by(matrix, &length/1, :desc)
    |> Enum.fetch!(0)
    |> length()
  end

  defp tostring(matrix) do
    Enum.reduce(matrix, [], fn x, acc -> acc ++ [String.trim_trailing(Enum.join(x), "|")] end)
    |> Enum.join("\n")
    |> String.replace("|", " ")
  end
end
