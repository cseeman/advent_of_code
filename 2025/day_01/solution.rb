require "pry"
class PasswordSorter
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def find_new_index(rotation, start_index)
    rotation_direction = rotation[0]
    rotation_amount = rotation[1..-1].to_i

    new_index = if rotation_direction == "R"
      start_index + rotation_amount
    else
      start_index - rotation_amount
    end

    # wrap around the 0-99 range using modulo
    new_index % 100
  end

  def check_if_zero(new_index)
    new_index == 0
  end

  def find_actual_password
    current_index = 50
    password = 0

    File.readlines(input).each do |line|
      current_index = find_new_index(line.strip, current_index)
      if check_if_zero(current_index)
        password += 1
      end
    end

    password
  end
end

puts PasswordSorter.new("input.txt").find_actual_password
