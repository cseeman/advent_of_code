class CleanItUp
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def invalid_ids_sum
    sum = 0
    File.readlines(input).each do |line|
      line = line.strip
      next if line.empty?

      line.split(",").each do |range_str|
        range_str = range_str.strip
        next if range_str.empty?

        if range_str.include?("-")
          start_id, end_id = range_str.split("-").map(&:to_i)

          (start_id..end_id).each do |id|
            if invalid_id?(id.to_s)
              sum += id.to_i
            end
          end
        end
      end
    end

    sum.to_i
  end

  def invalid_id?(id)
    # None of the numbers have leading zeroes
    return true if id.start_with?("0")

    # An ID is invalid if it is made only of some sequence of digits repeated at least twice.
    # So, 12341234 (1234 two times), 123123123 (123 three times), 1212121212 (12 five times),
    # and 1111111 (1 seven times) are all invalid IDs.
    # Check if the entire string consists of a repeating pattern
    (1..id.length / 2).each do |pattern_length|
      pattern = id[0, pattern_length]
      repetitions = id.length / pattern_length
      remainder = id.length % pattern_length

      # Pattern repeats exactly (no remainder) and at least twice
      if remainder == 0 && repetitions >= 2
        if pattern * repetitions == id
          return true
        end
      end
    end

    false
  end

  def right_now
    File.read(input)
      .scan(/(\d+)-(\d+)/).lazy
      .map { |s, e| s..e }
      .flat_map(&:to_a)
      .select(&/\A(?<seq>\d+)\k<seq>+\z/.method(:match?))
      .sum(&:to_i)
  end
end

puts CleanItUp.new("input.txt").invalid_ids_sum
puts CleanItUp.new("input.txt").right_now
