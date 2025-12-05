defmodule MultiplyMatricesTest do
  use ExUnit.Case
  doctest MultiplyMatrices

  test "return the list converted if all items are numbers" do
    list = ["1", "2", "3"]
    assert MultiplyMatrices.to_int(list) == [1, 2, 3]
  end

  test "return a list with exact items length of columns num" do
    input = "1 2 3 4 5 6 7\n"
    assert MultiplyMatrices.handle_row(input, 4) == [1, 2, 3, 4]
  end

  test "ensure row's length are exactly equal to num of columns" do
    list = "1 2 3 4 5 6 7\n"
    assert MultiplyMatrices.handle_row(list, 5) == [1, 2, 3, 4, 5]
  end
end
