# frozen_string_literal: true

require_relative './cleanup'

task_lists = File.readlines('inputs.txt', chomp: true)

optimize = Cleanup.new

task_lists.each do |tl|
  ranges = optimize.parse(tl)
  tasks = optimize.create_tasks(ranges)
  task1 = tasks[0]
  task2 = tasks[1]

  optimize.overlap?(task1, task2)
end

puts optimize.complete_overlaps
