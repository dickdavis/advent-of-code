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
  # = /lib/advent_of_code/base_solution.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Base class for all solutions.
  class BaseSolution
    def initialize(input)
      @input = input
    end

    def solutions
      raise NotImplementedError, 'Implement in subclass'
    end

    private

    attr_reader :input
  end
end
