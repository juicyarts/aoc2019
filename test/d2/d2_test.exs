defmodule D2Test do
  use ExUnit.Case
  doctest D2

  test "run_program" do
    assert D2.run_program([1, 0, 0, 0, 99], 0) == 2
    assert D2.run_program([2, 3, 0, 3, 99], 0) == 2
    assert D2.run_program([2, 4, 4, 5, 99, 0], 0) == 2
    assert D2.run_program([1, 1, 1, 4, 99, 5, 6, 0, 99], 0) == 30
  end

  test "part1" do
    {:ok, input} = File.read("test/d2/i.txt")
    res = String.to_integer(System.get_env("D2_P1"))
    assert D2.part1(input) == res
  end
end
