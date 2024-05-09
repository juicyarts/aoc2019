defmodule D1Test do
  use ExUnit.Case
  doctest D1

  test "calculate_fuel" do
    assert D1.calculate_fuel(12) == 2
    assert D1.calculate_fuel(14) == 2
    assert D1.calculate_fuel(1969) == 654
    assert D1.calculate_fuel(100_756) == 33583
  end

  test "calculate_fuel_recursive" do
    assert D1.calculate_fuel_recursive(14) == 2
    assert D1.calculate_fuel_recursive(1969) == 966
    assert D1.calculate_fuel_recursive(100_756) == 50346
  end

  test "part1" do
    {:ok, input} = File.read("test/d1/i.txt")
    assert D1.part1(input) == String.to_integer(System.get_env("D1_P1"))
  end

  test "part2" do
    {:ok, input} = File.read("test/d1/i.txt")
    assert D1.part2(input) == String.to_integer(System.get_env("D1_P2"))
  end
end
