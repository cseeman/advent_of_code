class PasswordSorter
  def initialize(lines)
    @lines = lines
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

  def count_zeros_during_rotation(rotation, start_index)
    rotation_direction = rotation[0]
    rotation_amount = rotation[1..-1].to_i
    count = 0

    (1..rotation_amount).each do |i|
      position = if rotation_direction == "R"
        (start_index + i) % 100
      else
        (start_index - i) % 100
      end
      count += 1 if position == 0
    end

    count
  end

  def find_actual_password
    current_index = 50
    password = 0

    @lines.each do |rotation|
      password += count_zeros_during_rotation(rotation, current_index)
      current_index = find_new_index(rotation, current_index)
    end

    password
  end
end

puts PasswordSorter.new(ARGF.readlines(chomp: true)).find_actual_password
# ruby solution.rb input.txt
