defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    username
    |> remove_nonchar()
  end

  defp remove_nonchar(list, char \\ '')
  defp remove_nonchar([], char), do: char
  # defp remove_nonchar([head | tail], char) when (head >= 64 and head <= 90), do: remove_nonchar(tail, char ++ [head])
  defp remove_nonchar([head | tail], char) when (head >= 97 and head <= 122), do: remove_nonchar(tail, char ++ [head])
  defp remove_nonchar([head | tail], char) when head === 95, do: remove_nonchar(tail, char ++ [head])
  defp remove_nonchar([head | tail], char) do
    replace_with = case head do
                      228 -> 'ae'
                      246 -> 'oe'
                      252 -> 'ue'
                      223 -> 'ss'
                      _ -> ''
                    end
    remove_nonchar(tail, char ++ replace_with)
  end
  # defp remove_nonchar([_ | tail ], char), do: remove_nonchar(tail, char)
end
