defmodule ConverterTest do
  use ExUnit.Case

  test "to_light_seconds returns ... something" do
    converted = Converter.to_light_seconds({:miles, 1000}, precision: 5)
    assert converted == 0.00537
  end

 test "To Light Seconds is correct for miles" do
  	lightSeconds = Converter.to_light_seconds({:miles, 1.0e6}, precision: 1)
  	assert lightSeconds == 5.4
  end

  test "To Light Seconds is correct for meters" do
  	lightSeconds = Converter.to_light_seconds({:meters, 1.0e9}, precision: 1)
  	assert lightSeconds == 3.3
  end

  test "To Light Seconds is correct for feet" do
  	lightSeconds = Converter.to_light_seconds({:feet, 1.0e9}, precision: 1)
  	assert lightSeconds == 1.0
  end

  test "nearest tenth rounds up" do
    assert Converter.to_nearest_tenth(3.222) == 3.2
  end

  test "to_km" do
    assert Converter.to_km(12345) == 12.345
  end
end