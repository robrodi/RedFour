defmodule PlanetTest do
	use ExUnit.Case

	setup do
		planets = [
			 %{name: "Mercury", type: :rocky, ev: 4.3},
			 %{name: "Venus", type: :rocky, ev: 10.4},
			 %{name: "Earth", type: :rocky, ev: 11.2},
			 %{name: "Mars", type: :rocky, ev: 5.0},
			 %{name: "Jupiter", type: :gaseous, ev: 59.5},
			 %{name: "Saturn", type: :gaseous, ev: 35.5},
			 %{name: "Uranus", type: :gaseous, ev: 21.3},
			 %{name: "Neptune", type: :gaseous, ev: 23.5}
		]
		{:ok, planets: planets}
	end

	test "list of planets" do
		planets = Planet.select
		assert planets != nil

	end
	test "Planets can be accessed with a key" do
		earth = Planet.select[:earth]
		assert earth != nil
	end

	test "Accounting for Venus blowing up", %{planets: planets} do
		venus = Enum.at(planets, 1)
		venus = %{venus | ev: 7.2}
		assert venus.ev == 7.2
	end

	test "Enum at", %{planets: planets} do
		p = Enum.at(planets, 2)
		assert p.name == "Earth"
	end

	test "Enum find", %{planets: planets} do
		p = Enum.find(planets, &(&1.ev == 4.3))
		assert p.name == "Mercury"
	end

	test "Enum filter", %{planets: planets} do
		p = Enum.filter(planets, &(&1.type == :rocky))
		assert length(p) == 4
	end

	test "Set Ev works for earth" do
		ev = Planet.select[:earth].ev
		assert ev == 11.2
	end

	test "Enum.map", %{planets: planets} do
		Enum.map(planets, &(&1.name)) |> assert_is_list_of_planet_names
	end

	test "a comprehension", %{planets: planets} do
		(for planet <- planets, do: planet.name) |> assert_is_list_of_planet_names
	end

	test "a comprehension with a filter", %{planets: planets} do
		(for planet <- planets, planet.type == :rocky, do: planet.name) |> assert_is_list_of_planet_names(4)
	end

	test "a comprehension with a filter, matched", %{planets: planets} do
		(for %{name: name, type: type} <- planets, type == :rocky, do: name)|> assert_is_list_of_planet_names(4)	
	end

	test "Earth Escape Velocity is correct" do
		ev = Planet.escape_velocity(Planet.earth)
		assert ev == 11.2
	end
	
	test "Mars Escape Velocity is correct" do
		ev = Planet.escape_velocity(Planet.mars)
		assert ev == 5.0
	end

	test "Moon Escape Velocity is correct" do
		ev = Planet.escape_velocity(Planet.moon)
		assert ev == 2.4
	end

	test "Ev is correct for another planet" do
		ev = %{mass: 4.0e22, radius: 6.21e6}
			|> Planet.escape_velocity
		assert ev == 0.9
	end
	defp assert_is_list_of_planet_names(planets), do: assert_is_list_of_planet_names(planets, 8)

	defp assert_is_list_of_planet_names(planets, expected_length) do
		assert length(planets) == expected_length
		mercury = planets |> first
		assert mercury == "Mercury" 
	end

	defp first(list) when is_list(list) do
		{:ok, value} = list |> Enum.fetch(0)
		value
	end
end
