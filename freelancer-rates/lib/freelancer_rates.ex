defmodule FreelancerRates do
  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    8 * hourly_rate /1
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    before_discount - sum_discount(before_discount, discount)
  end

  defp sum_discount(amount, discount) do
    amount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
    monthly_rate = 22 * daily_rate(hourly_rate)
    apply_discount(monthly_rate, discount)
    |> Float.ceil(0)
    |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
    budget / apply_discount(daily_rate(hourly_rate), discount)
    |> precision(1)
  end

  defp precision(number, decimal), do: Float.floor(number, decimal)
#:erlang.float_to_binary(number, [decimals: decimal])
end
