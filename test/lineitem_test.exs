defmodule LineItemTest do
  use ExUnit.Case
  doctest LineItem

  test "create line items" do
    assert %LineItem{}.description == ""
    assert %LineItem{}.amount == 0
    assert %LineItem{description: "line item"}.description == "line item"
    assert %LineItem{amount: -1.00}.amount == -1.00
    assert %LineItem{amount: 1.01}.amount == 1.01
  end

end
