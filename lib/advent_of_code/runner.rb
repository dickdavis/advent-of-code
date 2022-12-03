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
  class NoSolutionFileError < StandardError; end
  class NoInputFileError < StandardError; end

  ##
  # = /lib/advent_of_code/runner.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Runs the solution set for a given day.
  class Runner
    def initialize(year:, day:)
      @year = year
      @day = day
    end

    def call
      raise NoSolutionFileError unless File.exist?(solution_filename)
      raise NoInputFileError unless File.exist?(input_filename)

      solver_klass.new(input: input_file).solutions
    end

    private

    attr_reader :year, :day

    def input_file
      File.read(input_filename)
    end

    def input_filename
      File.join('./assets', 'inputs', year, "#{day}.txt")
    end

    def solution_filename
      File.join('./lib', 'solutions', "y#{year}", "d#{day}.rb")
    end

    def solver_klass
      Object.const_get("Solutions::Y#{year}::D#{day}")
    end
  end
end
