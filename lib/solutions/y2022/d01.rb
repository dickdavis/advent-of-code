# frozen_string_literal: true

module Solutions
  module Y2022
    ##
    # = /lib/solutions/y2022/d01.rb
    # Author::    Dick Davis
    # Copyright:: Copyright 2022 Dick Davis
    # License::   GNU Public License 3
    #
    # Solution for Day 1 of Advent of Code 2022
    class D01
      def initialize(input:)
        @input = input
      end

      def solutions
        parsed_input = [].tap do |arr|
          input.split("\n\n").each do |group|
            arr << group.split("\n").map(&:to_i).sum
          end
        end

        top_three = parsed_input.sort { |a, b| b <=> a }.take(3)

        [top_three.max, top_three.sum]
      end

      private

      attr_reader :input
    end
  end
end
