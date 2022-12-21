current = 0
top_three = []

File.readlines('inputs.txt', chomp: true).each do |line|
  if line.empty?
    largest = current if current > largest
    current = 0
    next
  end

  current += line.to_i
end

puts largest
