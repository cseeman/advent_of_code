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

  it "counts total removable rolls correctly" do
    expect(grid.total_removable_count).to eq(43)
  end
end
