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

require_relative 'runner'

require 'optparse'
require 'English'

trap('INT') do
  puts "\nTerminating..."
  exit
end

options = {}

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: bin/run [YYYYDD] [options]'

  opts.on('-p', '--performance', 'Displays the performance results for each solution.') do
    options[:performance] = true
  end

  opts.on('-l', '--license', 'Displays the copyright notice') do
    puts "This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
"
  end

  opts.on('-w', '--warranty', 'Displays the warranty statement') do
    puts "This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
"
  end

  opts.on_tail('-h', '--help', 'Displays the help screen') do
    puts opts
    exit
  end
end

begin
  optparse.parse!
rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $ERROR_INFO.to_s
  puts 'Use -h or --help for options.'
  exit 1
end

if ARGV[0].nil? || ARGV[0].length != 6
  puts 'Specify a year and day (format: YYYYDD).'
  exit 1
end

year = ARGV[0][0..3]
day = ARGV[0][4..5]

if year < '2022'
  puts 'Specify a valid year (as far back as 2022).'
  exit 1
elsif day < '01' || day > '25'
  puts 'Specify a valid day (between 1 and 25).'
  exit 1
end

begin
  solutions = AdventOfCode::Runner.new(year:, day:).call
  solutions.each.with_index(1) do |solution, index|
    print_solution = lambda do
      puts "Solution #{index}: #{solution[:solution]}"
    end

    if options[:performance]
      puts "==========START SOLUTION #{index}"
      print_solution.call
      printer = RubyProf::FlatPrinter.new(solution[:performance])
      printer.print($stdout, min_percent: 1)
      puts '==========END'
    else
      print_solution.call
    end
  end
rescue AdventOfCode::NoInputFileError
  puts 'No input file found for provided values.'
  exit 1
rescue AdventOfCode::NoSolutionFileError
  puts 'No solution file found for provided values.'
  exit 1
end
