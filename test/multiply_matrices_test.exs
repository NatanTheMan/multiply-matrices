defmodule MultiplyMatricesTest do
  use ExUnit.Case
  doctest MultiplyMatrices

  test "return the list converted if all items are numbers" do
    list = ["1", "2", "3"]
    assert MultiplyMatrices.validate(list) == [1, 2, 3]
  end
end
