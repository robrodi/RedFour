defmodule PhysicsTest do
use ExUnit.Case
  doctest Physics

  test "Earth Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:earth)
  	assert ev == 11.2
  end
  
  test "Mars Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:mars)
  	assert ev == 5.0
  end

  test "Moon Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:moon)
  	assert ev == 2.4
  end

  test "Ev is correct for another planet" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Physics.Rocketry.escape_velocity
  	assert ev == 0.9
  end

 

  test "Orbital Acceleartion at 100km" do
  	acceleration = Physics.Rocketry.orbital_acceleration(100)
  	assert acceleration == 9.515619587729839
  end

  test "Orbital Acceleartion at 0km" do
  	acceleration = Physics.Rocketry.orbital_acceleration(0)
  	assert acceleration == 9.816728237001842
  end

  test "orbital Term at 100km above good old earth" do
  	term = Physics.Rocketry.orbital_term(100)
  	assert term == 1.4
  end

  test "Extra Credit" do
  	height = Physics.Rocketry.orbital_height(4.0) |> Converter.to_nearest_tenth
  	assert height == 6420.0
  end

  test "orbital Term puts the craft in orbit for fourish hours" do
  	height = 7000
  	term = Physics.Rocketry.orbital_term(height)

  	assert term >= 4
  	assert term <= 5	
  end
end
