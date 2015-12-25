defmodule SpendHawk do
  def parse_capitalone_row(row) do
    desc = Enum.at(row, 4)
    debit = Enum.at(row, 5)
    credit = Enum.at(row, 6)
    cond do
      debit != "" ->
        {amt, _} = Float.parse(debit)
        %LineItem{description: desc, amount: -1 * amt}
      credit != "" ->
        {amt, _} = Float.parse(credit)
        %LineItem{description: desc, amount: amt}
    end
  end

  def parse_capitalone_csv(file_name) do
    File.stream!(file_name) |>
    CSV.decode |>
    parse_capitalone_row
  end
end
