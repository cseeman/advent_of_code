require "rspec"
require_relative "solution"

describe PasswordSorter do
  let(:test_input) { "test_input.txt" }
  let(:password_sorter) { PasswordSorter.new(test_input) }

  it "should initialize with the input" do
    expect(password_sorter.input).to eq(test_input)
  end

  it "should find the new index" do
    expect(password_sorter.find_new_index("L68", 50)).to eq(82)
  end

  it "should check if the new index is zero" do
    expect(password_sorter.check_if_zero(0)).to eq(true)
  end

  it "should find the new index if it is out of bounds" do
    expect(password_sorter.find_new_index("R48", 52)).to eq(0)
  end

  it "should find the new index if it is out of bounds" do
    expect(password_sorter.find_new_index("L82", 14)).to eq(32)
  end

  it "should find the actual password" do
    expect(password_sorter.find_actual_password).to eq(3)
  end
end
