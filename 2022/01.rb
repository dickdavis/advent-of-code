# frozen_string_literal: true

calories_per_elf = [].tap do |arr|
  elf = 0
  lines = []
  File.foreach('01.txt') do |line|
    if line.chomp.empty?
      arr[elf] = lines
      elf += 1
      lines = []
    else
      lines << line.chomp.to_i
    end
  end
end

counted_calories = calories_per_elf.map do |arr|
  arr.reduce(0) { |sum, n| sum + n }
end

puts "Part 1: #{counted_calories.max}"

top_three = [].tap do |arr|
  3.times do
    arr << counted_calories.sort!.pop
  end
end

puts "Part 2: #{top_three.reduce(0) { |sum, n| sum + n }}"
