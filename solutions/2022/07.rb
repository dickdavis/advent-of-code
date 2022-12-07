# frozen_string_literal: true

require './lib/advent_of_code/base_solution'

module Solutions
  ##
  # = /solutions/2022/07.rb
  # Author::    Dick Davis
  # Copyright:: Copyright 2022 Dick Davis
  # License::   GNU Public License 3
  #
  # Solution for Day 7 of Advent of Code 2022
  class Y2022D07 < AdventOfCode::BaseSolution
    def initialize(input:)
      super(input:)
      @directories = { dotdot: '/', full_name: '', files: [], dirs: {}, size_of_files: 0 }
      @pwd = @directories
      @dirs_under_target = []
      @dirs_over_target = []
      init_filesystem
    end

    private

    attr_reader :directories, :dirs_under_target

    ##
    # Returns the solution for the first exercise.
    def solve_for_first_exercise
      find_dirs_under_target(@directories)
      @dirs_under_target.sum
    end

    ##
    # Returns the solution for the second exercise.
    def solve_for_second_exercise
      total_disk_space = 70_000_000
      space_required_for_update = 30_000_000
      usable_space = total_disk_space - calculate_size_of_directory(@directories)
      space_needed = space_required_for_update - usable_space

      find_dirs_over_target(@directories, target: space_needed)
      @dirs_over_target.min
    end

    def find_dirs_under_target(directory)
      directory[:dirs].each do |_dir, structure|
        size = calculate_size_of_directory(structure)
        @dirs_under_target << size unless size > 100_000
        find_dirs_under_target(structure)
      end
    end

    def find_dirs_over_target(directory, target:)
      directory[:dirs].each do |_dir, structure|
        size = calculate_size_of_directory(structure)
        @dirs_over_target << size unless size < target
        find_dirs_over_target(structure, target:)
      end
    end

    def calculate_size_of_directory(directory)
      [].tap do |size_array|
        size_array << directory[:size_of_files]
        directory[:dirs].each do |_dir, structure|
          size_array << calculate_size_of_directory(structure)
        end
      end.sum
    end

    def init_filesystem
      input.each_line.map(&:strip).each do |line|
        next if line == '$ cd /'

        case line.split
        in ['$', 'cd', '..']
          cd_dot_dot
        in ['$', 'cd', dir]
          cd(dir)
        in ['$', 'ls']
          next
        in ['dir', dir]
          mkdir(dir)
        in [filesize, filename]
          touch(filesize:, filename:)
        end
      end
    end

    def mkdir(dir)
      @pwd[:dirs][dir.to_sym] = {
        dotdot: @pwd[:full_name],
        name: dir,
        full_name: "#{@pwd[:full_name]}/#{dir}",
        files: [],
        dirs: {},
        size_of_files: 0
      }
    end

    def touch(filesize:, filename:)
      @pwd[:files] << { filesize:, filename: }
      @pwd[:size_of_files] += filesize.to_i
    end

    def cd(dir)
      @pwd = @pwd[:dirs][dir.to_sym]
    end

    def cd_dot_dot
      dir_names = @pwd[:dotdot].split('/').map(&:to_sym).delete_if(&:empty?)
      dir_filler = [].tap { |a| dir_names.size.times { a << :dirs } }
      dir_to_cd = dir_filler.zip(dir_names).flatten
      @pwd = dir_to_cd.empty? ? @directories : @directories.dig(*dir_to_cd)
    end
  end
end
