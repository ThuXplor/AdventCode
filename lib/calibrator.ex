defmodule Advent2018.Calibrator do
  def calibrate(changes), do: Enum.sum(changes)

  def first_duplicate_frequency(
        changes,
        initial \\ %{current: 0, previous: %{o: true}},
        max_passes \\ 1000
      )

  def first_duplicate_frequency(_changes, _initial, 0), do: {:error, :exceeded_max_passes}

  def first_duplicate_frequency(changes, initial, max_passes) do
    changes
    |> Enum.reduce_while(initial, &find_duplicate_frequency/2)
    |> case do
      {:ok, frequency} -> {:ok, frequency}
      acc -> first_duplicate_frequency(changes, acc, max_passes - 1)
    end
  end

  defp find_duplicate_frequency(change, %{current: current, previous: previous}) do
    frequency = current + change

    if frequency == current or previous[frequency],
      do: {:halt, {:ok, frequency}},
      else:
        {:cont,
         %{
           current: frequency,
           previous: Map.put(previous, current, true)
         }}
  end
end
