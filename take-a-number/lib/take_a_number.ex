defmodule TakeANumber do
  def start() do
    # Please implement the start/0 function
    {:ok, pid} = Task.start(fn -> take_number(0) end)
    pid
  end

  defp take_number(count) do
    receive do
      {:report_state, sender_pid} -> send sender_pid, count
      take_number(count)
      {:take_a_number, sender_pid} -> send sender_pid, count+1
      take_number(count+1)
      :stop -> exit(:shutdown)
      _ -> take_number(count)
    end

  end
end
