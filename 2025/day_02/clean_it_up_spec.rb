require "rspec"
require_relative "clean_it_up"

describe CleanItUp do
  let(:clean_it_up) { CleanItUp.new("test_input.txt") }

  it "should initialize with the input" do
    expect(clean_it_up.instance_variable_get(:@input)).to eq("test_input.txt")
  end

  it "should check when an id is invalid" do
    expect(clean_it_up.invalid_id?("55")).to be true
    expect(clean_it_up.invalid_id?("6464")).to be true
    expect(clean_it_up.invalid_id?("123123")).to be true
    expect(clean_it_up.invalid_id?("123123456789")).to be false
    expect(clean_it_up.invalid_id?("00")).to be true
    expect(clean_it_up.invalid_id?("0123456789")).to be true
    expect(clean_it_up.invalid_id?("11")).to be true
    expect(clean_it_up.invalid_id?("22")).to be true
    expect(clean_it_up.invalid_id?("99")).to be true
    expect(clean_it_up.invalid_id?("1010")).to be true
    expect(clean_it_up.invalid_id?("1188511885")).to be true
    expect(clean_it_up.invalid_id?("222222")).to be true
    expect(clean_it_up.invalid_id?("446446")).to be true
    expect(clean_it_up.invalid_id?("38593859")).to be true
  end

  it "should count the number of invalid ids" do
    expect(clean_it_up.invalid_ids_sum).to eq(4174379265)
  end
end
