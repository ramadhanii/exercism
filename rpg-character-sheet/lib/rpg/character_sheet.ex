defmodule RPG.CharacterSheet do
  def welcome() do
    # Please implement the welcome/0 function
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    # Please implement the ask_name/0 function
    name = IO.gets("What is your character's name?\n")
    String.trim(name)
  end

  def ask_class() do
    # Please implement the ask_class/0 function
    class = IO.gets("What is your character's class?\n")
    String.trim(class)
  end

  def ask_level() do
    # Please implement the ask_level/0 function
    level = IO.getn("What is your character's level?\n")
    String.to_integer(level)
  end

  def run() do
    # Please implement the run/0 function
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()

    map = %{name: name, level: level, class: class}
    IO.inspect(map, label: "Your character")
  end
end
