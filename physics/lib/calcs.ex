defmodule Calcs do
  def square_root(val), do: :math.sqrt(val)
  def squared(val), do: val * val
  def cubed(val), do: val * val * val
  def cube_root(val), do: :math.pow(val, 1/3)
end