defmodule PhysicsTest do
use ExUnit.Case
  doctest Physics
  import Physics.Rocketry

  test "Orbital Acceleartion at 100km" do
  	acceleration = orbital_acceleration(100)
  	assert acceleration == 9.515619587729839
  end

  test "Orbital Acceleartion at 0km" do
  	acceleration = orbital_acceleration(0)
  	assert acceleration == 9.816728237001842
  end

  test "orbital Term at 100km above good old earth" do
  	term = orbital_term(100)
  	assert term == 1.4
  end

  test "Extra Credit" do
  	height = orbital_height(4.0) |> Converter.to_nearest_tenth
  	assert height == 6420.0
  end

  test "orbital Term puts the craft in orbit for fourish hours" do
  	height = 7000
  	term = orbital_term(height)

  	assert term >= 4
  	assert term <= 5	
  end
end
