# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/05.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 5 of Advent of Code 2022
  class Y2022D05 < AdventOfCode::BaseSolution
    private

    def instructions
      @instructions ||= input.split("\n").select { |line| line.start_with?('move') }
    end

    def initial_stack_state
      {
        1 => %w[J H P M S F N V],
        2 => %w[S R L M J D Q],
        3 => %w[N Q D H C S W B],
        4 => %w[R S C L],
        5 => %w[M V T P F B],
        6 => %w[T R Q N C],
        7 => %w[G V R],
        8 => %w[C Z S P D L R],
        9 => %w[D S J V G P B F]
      }
    end

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      stacks = initial_stack_state

      instructions.each do |line|
        line = line.split
        stacks[line[5].to_i] += stacks[line[3].to_i].pop(line[1].to_i).reverse
      end

      stacks.map { |_, v| v.pop }.join
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      stacks = initial_stack_state

      instructions.each do |line|
        line = line.split
        stacks[line[5].to_i] += stacks[line[3].to_i].pop(line[1].to_i)
      end

      stacks.map { |_, v| v.pop }.join
    end
  end
end
