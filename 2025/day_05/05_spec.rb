require "rspec"
require "yaml"
require_relative "05"

describe Day05 do
  let(:example_input) { File.readlines("examples/05/A.txt", chomp: true) }
  let(:expected) { YAML.load_file("examples/05/A_expected.yml") }

  it "solves part one with example input" do
    expect(Day05.part_one(example_input)).to eq(expected["part_one"])
  end
end
