defmodule SecretHandshake do
  @action %{
    4 => "jump",
    3 => "close your eyes",
    2 => "double blink",
    1 => "wink"
  }

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list = Integer.digits(code, 2)
    list
    |> handshake()
    |> reverse?(length(list) > 4)
  end

  defp handshake(code_list, res \\ [])
  defp handshake([1 | tail] = list, res) when length(list) == 5, do: handshake(tail, res)
  defp handshake([head | tail] = list, res) when length(list) < 5 do
    result = if head === 1, do: [Map.get(@action, length(list)) | res], else: res
    handshake(tail, result)
  end
  defp handshake([head], res), do: (if head === 1, do: ["wink" | res], else: res)
  defp handshake(_, res), do: res

  defp reverse?(list, true), do: Enum.reverse(list)
  defp reverse?(list, false), do: list
end
