# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/01.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 1 of Advent of Code 2022
  class Y2022D01 < AdventOfCode::BaseSolution
    private

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      top_three.max
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      top_three.sum
    end

    ##
    # Sorts the parsed input and returns the top three.
    def top_three
      @top_three ||= parsed_input.sort { |a, b| b <=> a }.take(3)
    end

    ##
    # Parsed the input file into an array of integers.
    def parsed_input
      @parsed_input ||= [].tap do |arr|
        input.split("\n\n").each do |group|
          arr << group.split("\n").map(&:to_i).sum
        end
      end
    end
  end
end
