defmodule D2 do
  @moduledoc """
  Documentation for `D2`.
  """

  def apply_instruction(op, a, b) do
    case op do
      1 -> a + b
      2 -> a * b
    end
  end

  def run_instruction(instructions, ptr) do
    case(ptr + 4 > length(instructions)) do
      true ->
        Enum.at(instructions, 0)

      false ->
        [op, source_a, source_b, target] =
          Enum.slice(instructions, ptr, 4)

        case op == 99 do
          true ->
            Enum.at(instructions, 0)

          false ->
            [a, b] = [Enum.at(instructions, source_a), Enum.at(instructions, source_b)]

            List.replace_at(instructions, target, apply_instruction(op, a, b))
            |> run_instruction(ptr + 4)
        end
    end
  end

  def part1(input) do
    input
    |> String.replace("\n", "")
    |> String.split(",", trim: true)
    |> Enum.map(&String.to_integer/1)
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> run_instruction(0)
  end
end
