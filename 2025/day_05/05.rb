module Day05
  class << self
    def part_one(input)
      ranges, ingredient_ids = parse_input(input)
      ingredient_ids.count { |id| fresh?(id, ranges) }
    end

    def part_two(input)
      ranges, _ingredient_ids = parse_input(input)
      count_unique_fresh_ids(ranges)
    end

    private

    def parse_input(input)
      sections = input.join("\n").split("\n\n")

      ranges = sections[0].lines.map do |line|
        start_id, end_id = line.strip.split("-").map(&:to_i)
        (start_id..end_id)
      end

      ingredient_ids = sections[1].lines.map { |line| line.strip.to_i }

      [ranges, ingredient_ids]
    end

    def fresh?(ingredient_id, ranges)
      ranges.any? { |range| range.cover?(ingredient_id) }
    end

    def count_unique_fresh_ids(ranges)
      merged = merge_ranges(ranges)
      merged.sum { |range| range.size }
    end

    def merge_ranges(ranges)
      sorted = ranges.sort_by(&:begin)

      sorted.each_with_object([]) do |range, merged|
        if merged.empty? || merged.last.end < range.begin - 1
          merged << range
        else
          new_end = [merged.last.end, range.end].max
          merged[-1] = (merged.last.begin..new_end)
        end
      end
    end
  end
end

if __FILE__ == $0
  input = ARGF.readlines(chomp: true)
  puts "Part 1: #{Day05.part_one(input)}"
  puts "Part 2: #{Day05.part_two(input)}"
end
# ruby 05.rb inputs/05.txt
