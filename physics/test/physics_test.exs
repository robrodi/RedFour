defmodule PhysicsTest do
use ExUnit.Case
  doctest Physics

  test "nearest tenth rounds up" do
    assert Converter.to_nearest_tenth(3.222) == 3.3
  end

  test "to_km" do
    assert Converter.to_km(12345) == 12.345
  end

  test "round down" do
    assert Converter.round_down(12.345) == 12
  end

  test "round up" do
    assert Converter.round_up(12.345) == 13
  end

  test "Earth Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:earth)
  	assert ev == 11.2
  end
  
  test "Mars Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:mars)
  	assert ev == 5.1
  end

  test "Moon Escape Velocity is correct" do
  	ev = Physics.Rocketry.escape_velocity(:moon)
  	assert ev == 2.4
  end

  test "Ev is correct for another planet" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Physics.Rocketry.escape_velocity
  	assert ev == 1.0
  end

  test "To Light Seconds is correct for miles" do
  	lightSeconds = Converter.to_light_seconds({:miles, 1.0e6})
  	assert lightSeconds == 6.0
  end

  test "To Light Seconds is correct for meters" do
  	lightSeconds = Converter.to_light_seconds({:meters, 1.0e9})
  	assert lightSeconds == 4.0
  end

  test "To Light Seconds is correct for feet" do
  	lightSeconds = Converter.to_light_seconds({:feet, 1.0e9})
  	assert lightSeconds == 2.0
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
  	assert term == 1.5
  end

  test "Extra Credit" do
  	height = Physics.Rocketry.orbital_height(4.0) |> Converter.round_down
  	assert height == 6419
  end

  test "orbital Term puts the craft in orbit for fourish hours" do
  	height = 7000
  	term = Physics.Rocketry.orbital_term(height)

  	assert term >= 4
  	assert term <= 5	
  end
end
