defmodule Solar do
	def power(%{classification: :M, scale: s}), do: s * 10
	def power(%{classification: :X, scale: s}), do: s * 1000
	def power(%{classification: :C, scale: s}), do: s * 1
	def no_eva(flares), do:	Enum.filter flares, &(power(&1) > 1000)
	def deadliest(flares), do: Enum.map(flares, &(power(&1))) |> Enum.max
	
	def flare_list(flares) do
		Enum.map flares, fn(flare) ->
			p = power(flare)
			{:flare, :power, p, :is_deadly, p > 1000}
		end
	end

	def total_flare_power(flares), do: (for flare <- flares, do: power(flare)) |> Enum.sum
end
