defmodule RemoteControlCar do
  @enforce_keys [:nickname]

  defstruct battery_percentage: 100, distance_driven_in_meters: 0, nickname: "none"
  # Please implement the struct with the specified fields

  def new(nickname \\ "none")
  def new(nickname) do
    # Please implement the new/1 function
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(%RemoteControlCar{} = remote_car) do
    # Please implement the display_distance/1 function
    "#{Map.fetch!(remote_car, :distance_driven_in_meters)} meters"
  end

  def display_battery(%RemoteControlCar{} = remote_car) do
    # Please implement the display_battery/1 function
    bat_percent = Map.fetch!(remote_car, :battery_percentage)
    if bat_percent == 0 do
      "Battery empty"
    else
      "Battery at #{bat_percent}%"
    end

  end

  def drive(%RemoteControlCar{} = remote_car) do
    # Please implement the drive/1 function
    remote_car
    |> do_update()
  end

  defp do_update(%RemoteControlCar{battery_percentage: 0} = remote_car), do: remote_car
  defp do_update(remote_car) do
    remote_car
    |> Map.update!(:battery_percentage, fn x -> x-1 end)
    |> Map.update!(:distance_driven_in_meters, fn x -> x+20 end)
  end
end
