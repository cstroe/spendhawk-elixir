defmodule SpendHawkTest do
  use ExUnit.Case
  doctest SpendHawk

  import SpendHawk

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "parsing a single capital one CSV debit row" do
    debit = ["", "", "", "", "description", "12.05", ""]
    %LineItem{description: desc, amount: amt} = parse_capitalone_row(debit)
    assert desc == "description"
    assert amt == -12.05
  end

  test "parsing a single capital one CSV credit row" do
    credit = ["", "", "", "", "description", "", "11.04"]
    %LineItem{description: desc, amount: amt} = parse_capitalone_row(credit)
    assert desc == "description"
    assert amt == 11.04
  end
end
