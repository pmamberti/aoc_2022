elves = []
current = 0

File.readlines('inputs.txt', chomp: true).each do |line|
  if line.empty?
    elves << current
    current = 0
    next
  end

  current += line.to_i
end

puts elves.sort.slice(-3..-1).sum
