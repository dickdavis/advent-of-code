# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  module Year2022
    ##
    # = /lib/solutions/year_2022/day_01.rb
    # Author::    Dick Davis
    # Copyright:: Copyright 2022 Dick Davis
    # License::   GNU Public License 3
    #
    # Solution for Day 1 of Advent of Code 2022
    class Day01 < AdventOfCode::BaseSolution
      def call
        parsed_input = [].tap do |arr|
          input.split("\n\n").each do |group|
            arr << group.split("\n").map(&:to_i).sum
          end
        end

        top_three = parsed_input.sort { |a, b| b <=> a }.take(3)

        [top_three.max, top_three.sum]
      end
    end
  end
end
