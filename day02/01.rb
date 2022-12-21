# frozen_string_literal: true

input = File.readlines('inputs.txt', chomp: true)
total_score = 0

scoring = {
  'A' => {
    type: :rock
  },
  'B' => {
    type: :paper
  },
  'C' => {
    type: :scissors
  },
  'X' => {
    value: 1,
    type: :rock
  },
  'Y' => {
    value: 2,
    type: :paper
  },
  'Z' => {
    value: 3,
    type: :scissors
  }
}

input.each do |line|
  choices = line.split(' ')
  opponent = scoring[choices.first]
  me = scoring[choices.last]
  total_score += me[:value]

  if opponent[:type] == me[:type]
    total_score += 3
  elsif me[:type] == :scissors && opponent[:type] == :paper
    total_score += 6
  elsif me[:type] == :rock && opponent[:type] == :scissors
    total_score += 6
  elsif me[:type] == :paper && opponent[:type] == :rock
    total_score += 6
  end
end

puts total_score