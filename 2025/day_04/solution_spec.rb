require "rspec"
require_relative "solution"

describe PaperRollGrid do
  let(:test_lines) do
    [
      "..@@.@@@@.",
      "@@@.@.@.@@",
      "@@@@@.@.@@",
      "@.@@@@..@.",
      "@@.@@@@.@@",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "@.@@@.@@@@",
      ".@@@@@@@@.",
      "@.@.@@@.@."
    ]
  end
  let(:grid) { PaperRollGrid.new(test_lines) }

  it "counts accessible rolls correctly" do
    expect(grid.accessible_roll_count).to eq(13)
  end
end
