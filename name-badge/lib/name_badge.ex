defmodule NameBadge do
  def print(nil, name, nil), do: print(nil, name, "owner")
  def print(nil, name, department), do: "#{name} - #{String.upcase(department)}"
  def print(id, name, department) do
    if is_nil(department) do
      print(id, name, "owner")
    else
      "[#{id}] - #{print(nil, name, department)}"
    end
  end
end
