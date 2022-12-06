# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/06.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 6 of Advent of Code 2022
  class Y2022D06 < AdventOfCode::BaseSolution
    private

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      catch(:unique) do
        input_as_array.each.with_index do |_char, index|
          throw(:unique, index + 4) if start_of_packet_marker?(index)
        end
      end
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      catch(:unique) do
        input_as_array.each.with_index do |_char, index|
          throw(:unique, index + 14) if start_of_message_marker?(index)
        end
      end
    end

    def input_as_array
      @input_as_array ||= input.chars
    end

    def start_of_packet_marker?(index)
      input_as_array[index, 4].uniq.size == 4
    end

    def start_of_message_marker?(index)
      input_as_array[index, 14].uniq.size == 14
    end
  end
end
