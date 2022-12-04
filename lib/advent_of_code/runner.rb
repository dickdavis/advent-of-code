# frozen_string_literal: true

# Copyright 2022 Dick Davis
#
# This file is part of advent-of-code.
#
# advent-of-code is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# advent-of-code is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with advent-of-code.  If not, see <http://www.gnu.org/licenses/>.

module AdventOfCode
  ##
  # = NoSolutionFileError
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Raised when a solution file is missing.
  class NoSolutionFileError < StandardError; end

  ##
  # = NoInputFileError
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Raised when an input file is missing.
  class NoInputFileError < StandardError; end

  ##
  # = /lib/advent_of_code/runner.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Runs the solution set for a given day.
  class Runner
    ##
    # Initializes the runner instance with the year and day.
    def initialize(year:, day:)
      @year = year
      @day = day
    end

    ##
    # Provides the input file to the solution instance and
    # returns an array with the solutions.
    def call
      raise NoInputFileError unless File.exist?(input_filename)
      raise NoSolutionFileError unless File.exist?(solution_filename)

      require solution_filename

      solver_klass.new(input: input_file).solutions
    end

    private

    attr_reader :year, :day

    ##
    # Reads the input file into memory.
    def input_file
      File.read(input_filename)
    end

    ##
    # Returns the filename of the input file.
    def input_filename
      File.join('./inputs', year, "#{day}.txt")
    end

    ##
    # Returns the filename of the solution file.
    def solution_filename
      File.join('./solutions', year, "#{day}.rb")
    end

    ##
    # Returns the constantized class name of the solution file.
    def solver_klass
      Object.const_get("Solutions::Y#{year}D#{day}")
    end
  end
end
