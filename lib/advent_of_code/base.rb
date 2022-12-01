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

##
# = /lib/advent_of_code/base.rb
# Author::    Dick Davis
# Copyright:: Copyright 2022 Dick Davis
# License::   GNU Public License 3
#
# Main application file that loads other files.
require_relative 'base_solution'
require_relative 'runner'

require 'optparse'
require 'English'

trap('INT') do
  puts "\nTerminating..."
  exit
end

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: advent_of_code [options]'

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

solutions = AdventOfCode::Runner.new(
  year: ARGV[0][0..3],
  day: ARGV[0][4..5]
).call

solutions.each.with_index(1) do |solution, index|
  puts "Solution #{index}: #{solution}"
end
