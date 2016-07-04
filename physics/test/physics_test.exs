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

  test "Ev is correct" do
  	ev = Physics.Rocketry.escape_velocity(:earth)
  	assert ev == 11.2
  end

  test "Ev is correct for another planet" do
  	ev = %{mass: 4.0e22, radius: 6.21e6}
  		|> Physics.Rocketry.escape_velocity
  	assert ev == 1.0
  end

  test "To Light Seconds is correct for miles" do
  	lightSeconds = Converter.to_light_seconds({:miles, 1.0e6})
  	assert lightSeconds == 5
  end

   test "To Light Seconds is correct for meters" do
  	lightSeconds = Converter.to_light_seconds({:meters, 1.0e9})
  	assert lightSeconds == 3
  end
end
