class PaperRollGrid
  ROLL = "@"
  EMPTY = "."
  NEIGHBOR_OFFSETS = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],           [0, 1],
    [1, -1],  [1, 0],  [1, 1]
  ]

  def initialize(lines)
    @grid = lines.map(&:chars)
  end

  def total_removable_count
    total = 0
    while (removed = remove_accessible_rolls) > 0
      total += removed
    end
    total
  end

  def accessible_roll_count
    @grid.each_with_index.sum do |row, row_index|
      row.each_with_index.count do |cell, col_index|
        roll?(cell) && accessible?(row_index, col_index)
      end
    end
  end

  private

  def remove_accessible_rolls
    positions_to_remove = []
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if roll?(cell) && accessible?(row_index, col_index)
          positions_to_remove << [row_index, col_index]
        end
      end
    end
    positions_to_remove.each { |row, col| @grid[row][col] = EMPTY }
    positions_to_remove.size
  end

  def roll?(cell)
    cell == ROLL
  end

  def accessible?(row, col)
    adjacent_roll_count(row, col) < 4
  end

  def adjacent_roll_count(row, col)
    NEIGHBOR_OFFSETS.count do |row_offset, col_offset|
      neighbor_row = row + row_offset
      neighbor_col = col + col_offset
      in_bounds?(neighbor_row, neighbor_col) && roll?(@grid[neighbor_row][neighbor_col])
    end
  end

  def in_bounds?(row, col)
    row >= 0 && row < @grid.length && col >= 0 && col < @grid[0].length
  end
end

if __FILE__ == $0
  lines = ARGF.readlines(chomp: true)
  puts "Part 1: #{PaperRollGrid.new(lines).accessible_roll_count}"
  puts "Part 2: #{PaperRollGrid.new(lines).total_removable_count}"
end
# ruby solution.rb input.txt
