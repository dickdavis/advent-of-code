# frozen_string_literal: true

calories_per_elf = [].tap do |arr|
  elf = 0
  lines = []
  File.foreach('01.txt') do |line|
    unless line.chomp.empty?
      lines << line.chomp.to_i
      next
    end

    arr[elf] = lines.sum
    elf += 1
    lines = []
  end
end

top_three = calories_per_elf.sort.reverse.take(3)

puts "Part 1: #{top_three.max} (Expected: 70296)"
puts "Part 2: #{top_three.sum} (Expected: 205381)"
