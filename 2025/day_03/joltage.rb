class Joltage
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def override(bank)
    digits = bank.to_s.chars.map(&:to_i)
    result = []
    start_position = 0

    12.times do |i|
      remaining_needed = 12 - i - 1
      end_position = digits.length - remaining_needed - 1

      max_digit = -1
      max_position = -1
      (start_position..end_position).each do |pos|
        if digits[pos] > max_digit
          max_digit = digits[pos]
          max_position = pos
        end
      end

      result << max_digit
      start_position = max_position + 1
    end

    result.join.to_i
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
      .map { |bank| override(bank) }
      .sum
  end
end

puts Joltage.new("input.txt").total_output
