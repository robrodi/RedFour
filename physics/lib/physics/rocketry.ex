# idiom def function(args, options)...
# idiom define a second function with default options => def function(args), do:function(args, some_thing: "Default Value")
# Idiom {:ok, result}, {:error, err}
# alternate idiom:
#   result
# 	{:error, err}  #pattern matches error case, otherwise it worked, and returned result above

defmodule Converter do

	def to_nearest_tenth(val) do
        Float.ceil val, 1
    end

    def to_km(velocity) do
    	velocity / 1000
    end

    def to_light_seconds({:miles, miles}) do
    	(miles * 5.36819e-6) |> round_up
    end

    def to_light_seconds({:meters, meters}) do (meters * 3.335638620368e-9) |> round_up
    end

    def to_light_seconds({:feet, feet}) do
    	(feet * 1.016702651488166404e-9) |> round_up
    end

    def round_down(val) when is_float(val), do: trunc(val)
    def round_up(val) when is_float(val), do: Float.ceil(val)
end

defmodule ConverterTwo do
  
  def to_light_seconds({unit, val}, precision: precision) do 
    case unit do 
      :miles -> from_miles(val)
      :meters -> from_meters(val)
      :feet -> from_feet(val)
      :inches -> from_inches(val)
    end |> round_up # example 1
  end

  defp from_miles(val), do: val * 5.36819e-6
  defp from_meters(val), do: val * 3.335638620368e-9
  defp from_feet(val), do: val * 1.016702651488166404e-9
  defp from_inches(val), do: val * 8.472522095734715723e-11
  defp round_to(val, precision), do: Float.round(val, precision)
  defp round_up(val) when is_float(val), do: Float.ceil(val)  
end

defmodule Physics.Rocketry do
	def escape_velocity(:earth) do
		%{mass: 5.972e24, radius: 6.37e6}
			|> escape_velocity
	end

    def escape_velocity(planet) when is_map(planet) do
		planet 
			|> calculate_escape
			|> Converter.to_km
			|> Converter.to_nearest_tenth
    end
 
    defp calculate_escape(%{mass: mass, radius: radius}) do
    	newtons_constant = 6.67e-11
    	2 * newtons_constant * mass / radius
    		|> :math.sqrt
    end
end