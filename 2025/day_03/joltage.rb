class Joltage
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def max_pair(bank)
    digits = bank.to_s.chars.map(&:to_i)
    max_joltage = 0

    (0...digits.length).each do |i|
      (i + 1...digits.length).each do |j|
        joltage = digits[i] * 10 + digits[j]
        max_joltage = [max_joltage, joltage].max
      end
    end

    max_joltage
  end

  def total_output
    File.readlines(input)
      .map(&:strip)
      .reject(&:empty?)
      .map(&:to_i)
      .map { |bank| max_pair(bank) }
      .sum
  end
end

puts Joltage.new("input.txt").total_output
