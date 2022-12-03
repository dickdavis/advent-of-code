# frozen_string_literal: true

require './lib/advent_of_code/base_solution'
require 'debug'

module Solutions
  module Year2022
    ##
    # = /lib/solutions/year_2022/day_03.rb
    # Author::    Dick Davis
    # Copyright:: Copyright 2022 Dick Davis
    # License::   GNU Public License 3
    #
    # Solution for Day 3 of Advent of Code 2022
    class Day03 < AdventOfCode::BaseSolution
      def call
        [scores_for_rucksacks.sum, badge_priorities_per_group.sum]
      end

      private

      def rucksacks
        @rucksacks ||= input.split
      end

      def value_map
        @value_map ||= lower_case_value_map.merge(upper_case_value_map)
      end

      def lower_case_value_map
        {}.tap do |value_map|
          'a'.upto('z').with_index(1) { |letter, index| value_map[letter.to_sym] = index }
        end
      end

      def upper_case_value_map
        {}.tap do |value_map|
          'A'.upto('Z').with_index(27) { |letter, index| value_map[letter.to_sym] = index }
        end
      end

      def scores_for_rucksacks
        [].tap do |scores|
          rucksacks.each do |rucksack|
            first, second = rucksack.chars.each_slice(rucksack.length / 2).to_a
            scores << value_map[first.intersection(second).first.to_sym]
          end
        end
      end

      def badge_priorities_per_group
        [].tap do |badges|
          (0..rucksacks.length - 1).step(3) do |index|
            first, second, third = rucksacks.slice(index..(index + 2)).map(&:chars)
            diff = first.intersection(second).intersection(third).first
            badges << value_map[diff.to_sym]
          end
        end
      end
    end
  end
end
