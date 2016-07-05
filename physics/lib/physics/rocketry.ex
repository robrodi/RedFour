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
	import Planets

	def escape_velocity(:earth), do: earth |> escape_velocity
	def escape_velocity(:mars), do: mars |> escape_velocity
	def escape_velocity(:moon), do: moon |> escape_velocity

    def escape_velocity(planet) when is_map(planet) do
		planet 
			|> calculate_escape
			|> to_km
			|> to_nearest_tenth
    end
 
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

    defp gravity(planet) when is_map(planet) do
    	newtons_gravitational_constant * planet.mass
	end
    defp orbital_radius(height) do
    	earth.radius + (height |> to_meters)
    end
    defp calculate_escape(%{mass: mass, radius: radius}) do
    	2 * newtons_gravitational_constant * mass / radius
    		|> square_root
    end

end