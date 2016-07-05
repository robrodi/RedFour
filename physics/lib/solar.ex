defmodule Solar do
	def power(%{classification: :M, scale: s}), do: s * 10
	def power(%{classification: :X, scale: s}), do: s * 1000
	def power(%{classification: :C, scale: s}), do: s * 1
	def no_eva(flares), do:	Enum.filter flares, &(power(&1) > 1000)
	def deadliest(flares), do: Enum.map(flares, &(power(&1))) |> Enum.max
	
	def total_flare_power(list) do
		total_flare_power list, 0
	end

	defp total_flare_power([], total), do: total
	
	defp total_flare_power([head|tail], total), do: total_flare_power(tail, total + power(head))
end
