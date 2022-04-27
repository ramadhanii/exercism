defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) ::
          {{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}
  # def from({{year, month, day}, {hours, minutes, seconds}}, gigasecond \\ 100)
  def from(curr_date) do
    {:ok, naive_dt} = NaiveDateTime.from_erl(curr_date)

    naive_dt
    |> NaiveDateTime.add(1_000_000_000)
    |> NaiveDateTime.to_erl()
  end

end
