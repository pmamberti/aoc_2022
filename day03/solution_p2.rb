# frozen_string_literal: true

require_relative 'backpack'

backpacks = File.readlines('inputs_2.txt', chomp: true)
solution = 0
batch = []

backpacks.each do |b|
  batch << b
  next unless batch.size == 3

  badge = Backpack.badge(batch)
  solution += Backpack.priority(badge)
  batch = []
end

puts solution
