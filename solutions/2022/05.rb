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

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      solve(stacks: parse_initial_stacks)
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      solve(stacks: parse_initial_stacks, machine: 9001)
    end

    def solve(stacks:, machine: 9000)
      instructions.each do |line|
        line = line.split
        stacks_to_move = stacks[line[3].to_i].pop(line[1].to_i)
        stacks[line[5].to_i] += (machine == 9000 ? stacks_to_move.reverse : stacks_to_move)
      end

      stacks.map { |_, v| v.pop }.join
    end

    def instructions
      @instructions ||= input.split("\n").select { |line| line.start_with?('move') }
    end

    def parse_initial_stacks
      {}.tap do |stacks|
        stack_data = input.split("\n").select { |line| line.start_with?('[') || line.end_with?(']') }
        total_stack_count = (stack_data.first.chars.count / 4.to_f).ceil

        (1..total_stack_count).each do |i|
          stacks[i] = []
        end

        stack_data.each do |line|
          line.chars.each_slice(4).with_index(1) do |slot, index|
            stacks[index] << slot[1] if slot[0] == '['
          end
        end

        stacks.each_value(&:reverse!)
      end
    end
  end
end
