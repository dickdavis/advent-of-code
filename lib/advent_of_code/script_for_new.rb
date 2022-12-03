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
# = /lib/advent_of_code/base_new.rb
# Author::    Dick Davis
# Copyright:: Copyright 2022 Dick Davis
# License::   GNU Public License 3
#
# Processes user input and generates a new solution file.
require 'optparse'
require 'English'
require 'fileutils'
require 'erb'

trap('INT') do
  puts "\nTerminating..."
  exit
end

optparse = OptionParser.new do |opts|
  opts.banner = 'Usage: bin/new [YYYYDD] [options]'

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

@year = ARGV[0][0..3]
@day = ARGV[0][4..5]

if @year < '2022'
  puts 'Specify a valid year (as far back as 2022).'
  exit 1
elsif @day < '01' || @day > '25'
  puts 'Specify a valid day (between 1 and 25).'
  exit 1
end

directory = File.join('./lib', 'solutions', "y#{@year}")
FileUtils.mkdir_p(directory)
solution_filename = File.join(directory, "d#{@day}.rb")
if File.exist?(solution_filename)
  puts 'Solution file already exists.'
  exit 1
end

solution_file = File.new(solution_filename, 'w')
template_file = File.expand_path(File.join('./templates', 'new_solution.rb.erb'))
rendered_template = ERB.new(File.read(template_file)).result(binding)
solution_file.puts(rendered_template)
solution_file.close
puts 'Solution file created.'
