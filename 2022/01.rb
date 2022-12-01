# frozen_string_literal: true

parsed_input = [].tap do |arr|
  File.read('01.txt').split("\n\n").each do |group|
    arr << group.split("\n").map(&:to_i).sum
  end
end

top_three = parsed_input.sort { |a, b| b <=> a }.take(3)

puts "Part 1: #{top_three.max} (Expected: 70296)"
puts "Part 2: #{top_three.sum} (Expected: 205381)"
