defmodule Converter do
	def to_nearest_tenth(val) do
        Float.ceil val, 1
    end


    def to_km(velocity) do
    	velocity / 1000
    end

    def to_meters(distance) do
        distance * 1000        
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
    def seconds_to_hours(val)  when is_integer(val) or is_float(val) do
      val / 3600 |> to_nearest_tenth
    end
    def hours_to_seconds(val)  when is_integer(val) or is_float(val) do
      val * 3600 |> to_nearest_tenth
    end
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