defmodule SecretHandshake do
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
    reverse = if length(list) > 4, do: true, else: false

    list
    |> handshake()
    |> reverse?(reverse)
  end

  defp handshake(code_list, res \\ [])
  defp handshake([1 | [_, _, _ , _] = tail], res), do: handshake(tail, res)
  defp handshake([head | [_, _, _ ] = tail], res), do: handshake(tail, (if head === 1, do: ["jump" | res], else: res))
  defp handshake([head | [_, _] = tail], res), do: handshake(tail, (if head === 1, do: ["close your eyes" | res], else: res))
  defp handshake([head | [_] = tail], res), do: handshake(tail, (if head === 1, do: ["double blink" | res], else: res))
  defp handshake([head], res), do: (if head === 1, do: ["wink" | res], else: res)
  defp handshake(_, res), do: res

  defp reverse?(list, true), do: Enum.reverse(list)
  defp reverse?(list, false), do: list
end
