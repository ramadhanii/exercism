defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    # Please implement the initial/1 function
    up_name = String.upcase(name)
    first_letter(up_name) <> "."
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    String.split(full_name, " ")
    |> get_initial()
  end

  defp get_initial(list, init \\ "")
  defp get_initial([head | tail], init), do: get_initial(tail, "#{init} #{initial(head)}")
  defp get_initial(_, initial), do: String.trim(initial)

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """

    # Please implement the pair/2 function
    # "#{initials(full_name1)} + #{initials(full_name2)}"
  end
end
