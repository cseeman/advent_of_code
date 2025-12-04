require "rspec"
require_relative "joltage"

describe Joltage do
  let(:joltage) { Joltage.new("test_input.txt") }

  it "should find the max joltage" do
    expect(joltage.max_pair(987654321111111)).to eq(98)
  end

  it "should find the anothers max joltage" do
    expect(joltage.max_pair(818181911112111)).to eq(92)
  end

  it "should find the anothers max joltage without rearranging the batteries" do
    expect(joltage.max_pair(234234234234278)).to eq(78)
  end

  it "should find the anothers max joltage without rearranging the batteries" do
    expect(joltage.max_pair(2222222322121523223222213232233421252123126222322231213332212224251322442212422523422123222524243222)).to eq(65)
  end
  it "should find the total output" do
    expect(joltage.total_output).to eq(357)
  end
end
