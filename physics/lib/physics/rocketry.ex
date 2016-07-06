# idiom def function(args, options)...
# idiom define a second function with default options => def function(args), do:function(args, some_thing: "Default Value")
# Idiom {:ok, result}, {:error, err}
# alternate idiom:
#   result
# 	{:error, err}  #pattern matches error case, otherwise it worked, and returned result above

defmodule Physics.Rocketry do
	import Calcs
	import Converter
	import Physics.Laws
	import Planet
 
    def orbital_speed(height) do
    	(earth |> gravity) / orbital_radius(height)
    		|> square_root
    end

    def orbital_acceleration(height) do
    	(orbital_speed(height) |> squared) / orbital_radius(height)
    end

    def orbital_term(height) do
    	4 * (:math.pi |> squared) * (orbital_radius(height) |> cubed) / 
    		(earth |> gravity)
    		|> square_root
    		|> seconds_to_hours
    end

    def orbital_height(target_time_in_hours) do
    	secondsSquared = target_time_in_hours |> hours_to_seconds |> squared
    	(earth |> gravity) * secondsSquared  / (4 * (:math.pi |> squared))
			|> cube_root
			|> from_surface
			|> to_km
    end
    def from_surface(val), do: val - earth.radius

    defp gravity(planet) when is_map(planet) do
    	newtons_gravitational_constant * planet.mass
	end
    defp orbital_radius(height) do
    	earth.radius + (height |> to_meters)
    end
end