# frozen_string_literal: true

class Backpack
  def self.check(str)
    midpoint = (str.length / 2) - 1
    first_half = str[0..midpoint]
    second_half = str[midpoint + 1..]

    first_half.each_char do |c|
      return c if second_half.include?(c)
    end
  end

  def self.priority(char)
    if char == char.downcase
      char.ord - 96
    else
      char.ord - 38
    end
  end
end
