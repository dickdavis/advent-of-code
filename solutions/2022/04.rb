# frozen_string_literal: true

module Solutions
  ##
  # = /solutions/2022/04.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 4 of Advent of Code 2022
  class Y2022D04
    ##
    # Initializer for solution
    # input: the input used to derive a solution
    def initialize(input:)
      @input = input
    end

    ##
    # Return an array with your solutions for each part.
    def solutions
      [first_solution, second_solution]
    end

    private

    attr_reader :input

    def first_solution
      elf_pairs_with_entire_overlap.count
    end

    def second_solution
      elf_pairs_with_some_overlap.count
    end

    ##
    # Sorts the input into an array of integer pairs representing
    # the start and end of each shift in an elf pair.
    def elf_pairs
      [].tap do |array|
        input.each_line.map do |line|
          array << [].tap do |pair_array|
            line.chomp.split(',').each do |pair|
              pair_array << pair.split('-').map(&:to_i)
            end
          end
        end
      end
    end

    ##
    # Returns an array of elf pairs in which the shifts overlap entirely.
    def elf_pairs_with_entire_overlap
      elf_pairs.keep_if do |pair|
        (pair.first[0] >= pair.last[0] && pair.first[1] <= pair.last[1]) ||
          (pair.first[0] <= pair.last[0] && pair.first[1] >= pair.last[1])
      end
    end

    ##
    # Returns an array of elf pairs in which the shifts overlap in some way.
    def elf_pairs_with_some_overlap
      elf_pairs.keep_if do |pair|
        (pair.first[0] >= pair.last[0] && pair.first[0] <= pair.last[1]) ||
          (pair.last[0] >= pair.first[0] && pair.last[0] <= pair.first[1])
      end
    end
  end
end
