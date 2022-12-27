# frozen_string_literal: true

class Cleanup
  attr_reader :total_overlaps

  def initialize
    @total_overlaps = 0
  end

  def parse(entry)
    entry.scan(/\d*/)
         .map(&:to_i)
         .reject(&:zero?)
  end

  def create_tasks(parsed_entry)
    first_worker = (parsed_entry[0]..parsed_entry[1]).to_a
    second_worker = (parsed_entry[2]..parsed_entry[3]).to_a

    [first_worker, second_worker]
  end

  def overlap?(task1, task2)
    if (task1.difference(task2) == []) || (task2.difference(task1) == [])
      @total_overlaps += 1
      return true
    end

    false
  end
end
