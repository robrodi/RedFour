defmodule CompilerProblemTest do
  use ExUnit.Case 
  import Converter

  test "rounding an integer" do
    val = 19.0 |> round_to(0)
    assert val == 19
  end

  test "rounding a float" do
    val = 1.9 |> round_to
    assert val == 2.0
  end

  test "converting m to km" do
    val = 120.5 |> to_km
    assert val == 0.1205
  end
end