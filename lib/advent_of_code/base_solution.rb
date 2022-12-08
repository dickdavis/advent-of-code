# frozen_string_literal: true

require 'ruby-prof'

module AdventOfCode
  ##
  # = /advent-of-code/base_solution.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Base solution class for Advent of Code.
  class BaseSolution
    ##
    # Initializer for solution
    # input: the input used to derive a solution
    def initialize(input:)
      @input = input
    end

    ##
    # Return an array with your solutions for each part.
    # Default is to return the first and second solutions.
    # Override this method in subclass to return number of solutions desired.
    def solutions
      [first_solution, second_solution]
    end

    private

    attr_reader :input

    ##
    # Returns the solution with performance data for the first exercise.
    def first_solution
      RubyProf.start
      solution = solve_for_first_exercise
      performance = RubyProf.stop
      { solution:, performance: }
    end

    ##
    # Returns the solution with performance data for the second exercise.
    def second_solution
      RubyProf.start
      solution = solve_for_second_exercise
      performance = RubyProf.stop
      { solution:, performance: }
    end

    ##
    # Must be implemented in the solution subclass.
    def solve_for_first_exercise
      raise NotImplementedError, 'You must implement solve_for_first_exercise'
    end

    ##
    # Must be implemented in the solution subclass.
    def solve_for_second_exercise
      raise NotImplementedError, 'You must implement solve_for_second_exercise'
    end
  end
end
