# frozen_string_literal: true

module Solutions
  ##
  # = /solutions/2022/03.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 3 of Advent of Code 2022
  class Y2022D03
    def initialize(input:)
      @input = input
    end

    def solutions
      [scores_for_rucksacks.sum, badge_priorities_per_group.sum]
    end

    private

    attr_reader :input

    def rucksacks
      @rucksacks ||= input.split
    end

    def value_map
      @value_map ||= {}.tap do |value_map|
        'a'.upto('z').with_index(1) { |letter, index| value_map[letter.to_sym] = index }
        'A'.upto('Z').with_index(27) { |letter, index| value_map[letter.to_sym] = index }
      end
    end

    def scores_for_rucksacks
      [].tap do |scores|
        rucksacks.each do |rucksack|
          first, second = rucksack.chars.each_slice(rucksack.length / 2).to_a
          common_item_type = first.intersection(second).first
          scores << value_map[common_item_type.to_sym]
        end
      end
    end

    def badge_priorities_per_group
      [].tap do |badge_priorities|
        (0..rucksacks.length - 1).step(3) do |index|
          first, second, third = rucksacks.slice(index..(index + 2)).map(&:chars)
          common_badge_item_type = first.intersection(second).intersection(third).first
          badge_priorities << value_map[common_badge_item_type.to_sym]
        end
      end
    end
  end
end
