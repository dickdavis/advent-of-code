# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/08.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 8 of Advent of Code 2022
  class Y2022D08 < AdventOfCode::BaseSolution
    def grid
      @grid ||= input.split("\n").map { |line| line.chars.map(&:to_i) }
    end

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      visible_trees.count
    end

    def visible_trees
      @visible_trees ||= find_visible_trees
    end

    def find_visible_trees
      [].tap do |visible_trees|
        grid.each.with_index do |row, row_index|
          row.each.with_index do |height, col_index|
            if visible?(height:, row: row_index, column: col_index)
              visible_trees << { height:, row: row_index, column: col_index }
            end
          end
        end
      end
    end

    def visible?(height:, row:, column:)
      return true if visible_from_top?(height:, row:, column:)
      return true if visible_from_bottom?(height:, row:, column:)
      return true if visible_from_left?(height:, row:, column:)
      return true if visible_from_right?(height:, row:, column:)

      false
    end

    def visible_from_top?(height:, row:, column:)
      return true if row.zero?

      visible = true

      (row - 1).downto(0).each do |r|
        visible = false if grid[r][column] >= height
      end

      visible
    end

    def visible_from_bottom?(height:, row:, column:)
      return true if row == grid.length - 1

      visible = true

      (row + 1).upto(grid.length - 1).each do |r|
        visible = false if grid[r][column] >= height
      end

      visible
    end

    def visible_from_left?(height:, row:, column:)
      return true if column.zero?

      visible = true

      grid[row][0, column].each do |col|
        visible = false if col >= height
      end

      visible
    end

    def visible_from_right?(height:, row:, column:)
      return true if grid[row].length - 1 == column

      visible = true

      grid[row].slice(column + 1, grid[row].length - column).each do |col|
        visible = false if col >= height
      end

      visible
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      scenic_scores.max
    end

    def scenic_scores
      [].tap do |scenic_scores|
        grid.each.with_index do |row, row_index|
          row.each.with_index do |height, col_index|
            scenic_scores << calculate_scenic_score(height:, row: row_index, column: col_index)
          end
        end
      end
    end

    def calculate_scenic_score(height:, row:, column:)
      viewing_distance_to_top(height:, row:, column:) *
        viewing_distance_to_bottom(height:, row:, column:) *
        viewing_distance_to_left(height:, row:, column:) *
        viewing_distance_to_right(height:, row:, column:)
    end

    def viewing_distance_to_top(height:, row:, column:)
      return 0 if row.zero?

      distance = 0

      (row - 1).downto(0).each do |r|
        distance += 1
        break if grid[r][column] >= height
      end

      distance
    end

    def viewing_distance_to_bottom(height:, row:, column:)
      return 0 if row == grid.length - 1

      distance = 0

      (row + 1).upto(grid.length - 1).each do |r|
        distance += 1
        break if grid[r][column] >= height
      end

      distance
    end

    def viewing_distance_to_left(height:, row:, column:)
      return 0 if column.zero?

      distance = 0

      grid[row][0, column].reverse.each.with_index(1) do |col, index|
        distance = index
        break if col >= height
      end

      distance
    end

    def viewing_distance_to_right(height:, row:, column:)
      return 0 if grid[row].length - 1 == column

      distance = 0

      grid[row].slice(column + 1, grid[row].length - column).each.with_index(1) do |col, index|
        distance = index
        break if col >= height
      end

      distance
    end
  end
end
