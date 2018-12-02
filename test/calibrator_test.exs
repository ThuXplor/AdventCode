defmodule Advent2018.CalibratorTest do
  use ExUnit.Case

  alias Advent2018.Calibrator
  alias Advent2018.Inputs

  doctest Calibrator

  test "calibrate #1" do
    assert 522 == Calibrator.calibrate(Inputs.frequency_changes())
  end

  test "first_duplicate_frequency #2" do
    assert {:ok, 73364} == Calibrator.first_duplicate_frequency(Inputs.frequency_changes())
  end
end
