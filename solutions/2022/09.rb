# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/09.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 9 of Advent of Code 2022
  class Y2022D09 < AdventOfCode::BaseSolution
    attr_reader :head, :trail, :last_move
    attr_accessor :tail_pos

    def initialize(input:)
      super(input:)
      @head = { x: 0, y: 0 }
      @tail_pos = { x: 0, y: 0 }
      @trail = [{ x: 0, y: 0 }]
      @last_move = []
    end

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      process_moves
      trail.count
    end

    def process_moves
      moves.each do |move|
        puts "Processing move #{move}"
        @last_move = move

        case move
        in ['R', num]
          move_x((num.to_i))
        in ['L', num]
          move_x(num.to_i * -1)
        in ['U', num]
          move_y(num.to_i)
        in ['D', num]
          move_y((num.to_i * -1))
        end

        puts trail
      end
    end

    def moves
      @moves ||= input.split("\n").map(&:split)
    end

    def move_x(steps)
      steps.abs.times do |step|
        direction = steps.negative? ? :left : :right
        head[:x] += (direction == :left ? -1 : 1)
        puts "Moved #{step + 1} times to #{head}"
        leave_trail(axis: :x, direction:)
      end
    end

    def move_y(steps)
      steps.abs.times do |step|
        direction = steps.negative? ? :down : :up
        head[:y] += (direction == :down ? -1 : 1)
        leave_trail(axis: :y, direction:)
        puts "Moved #{step + 1} times to #{head}"
      end
    end

    def leave_trail(axis:, direction:)
      tail = calculate_tail(axis:, direction:)

      @tail_pos = tail
      if visited?(x_coord: tail[:x], y_coord: tail[:y])
        puts "Already visited #{tail}"
      else
        puts "Left trail at #{tail}"
        trail << tail
      end
    end

    def visited?(x_coord:, y_coord:)
      trail.include?({ x: x_coord, y: y_coord })
    end

    def calculate_tail(axis:, direction:)
      if ((head[:x].abs - tail_pos[:x].abs).abs == 1) && ((head[:y].abs - tail_pos[:y].abs).abs == 1) ||
         ((tail_pos[:x].abs - head[:x].abs).abs == 1) && ((tail_pos[:y].abs - head[:y].abs).abs == 1)
        puts 'Head and tail are diagonal'
        { x: trail.last[:x], y: trail.last[:y] }
      elsif (head[:x].abs - trail.last[:x].abs == 2) || (trail.last[:x].abs - head[:x].abs == 2)
        if axis == :x && direction == :left
          puts 'Moving left'
          { x: head[:x] + 1, y: head[:y] }
        elsif axis == :x && direction == :right
          puts 'Moving right'
          { x: head[:x] - 1, y: head[:y] }
        elsif axis == :y && direction == :up
          puts 'Moving up'
          { x: head[:x], y: head[:y] - 1 }
        elsif axis == :y && direction == :down
          puts 'Moving down 1'
          { x: head[:x], y: head[:y] + 1 }
        end
      elsif (head[:y].abs - trail.last[:y].abs == 2) || (trail.last[:y].abs - head[:y].abs == 2)
        if axis == :x && direction == :left
          puts 'Moving left'
          { x: head[:x] + 1, y: head[:y] }
        elsif axis == :x && direction == :right
          puts 'Moving right'
          { x: head[:x] - 1, y: head[:y] }
        elsif axis == :y && direction == :up
          puts 'Moving up'
          { x: head[:x], y: head[:y] - 1 }
        elsif axis == :y && direction == :down
          puts 'Moving down'
          { x: head[:x], y: head[:y] + 1 }
        end
      else
        { x: tail_pos[:x], y: tail_pos[:y] }
      end
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      nil
    end
  end
end
