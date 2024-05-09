defmodule D1 do
  @moduledoc """
  Documentation for `D1`.
  """

  def calculate_fuel(mass) do
    ceil(div(mass, 3)) - 2
  end

  def calculate_fuel_recursive(mass) do
    res = ceil(div(mass, 3)) - 2
    (res <= 0 && 0) || res + calculate_fuel_recursive(res)
  end

  @doc """
  Documentation for `part1`.
  """
  @spec part1(String.t()) :: integer
  def part1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel/1)
    |> Enum.sum()
  end

  @doc """
  Documentation for `part2`.
  """
  @spec part2(String.t()) :: integer
  def part2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&calculate_fuel_recursive/1)
    |> Enum.sum()
  end
end
