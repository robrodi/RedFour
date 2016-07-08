defmodule AmnesiaTest do
	use ExUnit.Case
	use Physics.Database

	test "Something" do
		assert 1 == 1
	end

	setup.all do
		Amnesia.Schema.create
		Amnesia.Start
		Physics.Database.create!

		res = Amnesia.transaction! do
			planets = [
				 %Planet{name: "Mercury", type: :rocky, mass: 3.3e23, radius: 2.49e6},
				 %Planet{name: "Venus", type: :rocky, mass: 4.86e24, radius: 6.05e6},
				 %Planet{name: "Earth", type: :rocky, mass: 5.972e24, radius: 6.37e6},
				 %Planet{name: "Mars", type: :rocky, mass: 6.41e23, radius: 3.37e6},
				 %Planet{name: "Jupiter", type: :gaseous, mass: 1.89e27, radius: 7.14e7},
				 %Planet{name: "Saturn", type: :gaseous, mass: 5.68e26, radius: 6.02e7},
				 %Planet{name: "Uranus", type: :gaseous, mass: 8.68e25, radius: 2.55e7},
				 %Planet{name: "Neptune", type: :gaseous, mass: 1.02e26, radius: 2.47e7},
			]

			for planet <- planets, do: planet |> Planet.write!
		end

		on_exit fn ->
			Physics.Database.destroy
			Amnesia.stop
			Amnesia.Schema.destroy
		end
	end
end
