require_relative 'backpack'

backpacks = File.readlines('inputs.txt')
solution = 0

backpacks.each do |b|
  misplaced = Backpack.check(b.strip)
  solution += Backpack.priority(misplaced)
end

puts solution
