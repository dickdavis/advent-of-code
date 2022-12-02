# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  module Year2022
    ##
    # = /lib/solutions/year_2022/day_02.rb
    # Author::    Dick Davis
    # Copyright:: Copyright 2022 Dick Davis
    # License::   GNU Public License 3
    #
    # Solution for Day 2 of Advent of Code 2022
    class Day02 < AdventOfCode::BaseSolution
      ROCK = 1
      PAPER = 2
      SCISSORS = 3
      LOSE = 0
      DRAW = 3
      WIN = 6
      private_constant :ROCK, :PAPER, :SCISSORS, :WIN, :LOSE, :DRAW

      def call
        [scores_for_first_exercise.sum, scores_for_second_exercise.sum]
      end

      private

      def scores_for_first_exercise
        [].tap do |arr|
          input.each_line.map do |line|
            case line.split
            in ['A', 'X']
              arr << (ROCK + DRAW)
            in ['A', 'Y']
              arr << (PAPER + WIN)
            in ['A', 'Z']
              arr << (SCISSORS + LOSE)
            in ['B', 'X']
              arr << (ROCK + LOSE)
            in ['B', 'Y']
              arr << (PAPER + DRAW)
            in ['B', 'Z']
              arr << (SCISSORS + WIN)
            in ['C', 'X']
              arr << (ROCK + WIN)
            in ['C', 'Y']
              arr << (PAPER + LOSE)
            in ['C', 'Z']
              arr << (SCISSORS + DRAW)
            end
          end
        end
      end

      def scores_for_second_exercise
        [].tap do |arr|
          input.each_line.map do |line|
            case line.split
            in ['A', 'X']
              arr << (SCISSORS + LOSE)
            in ['A', 'Y']
              arr << (ROCK + DRAW)
            in ['A', 'Z']
              arr << (PAPER + WIN)
            in ['B', 'X']
              arr << (ROCK + LOSE)
            in ['B', 'Y']
              arr << (PAPER + DRAW)
            in ['B', 'Z']
              arr << (SCISSORS + WIN)
            in ['C', 'X']
              arr << (PAPER + LOSE)
            in ['C', 'Y']
              arr << (SCISSORS + DRAW)
            in ['C', 'Z']
              arr << (ROCK + WIN)
            end
          end
        end
      end
    end
  end
end
