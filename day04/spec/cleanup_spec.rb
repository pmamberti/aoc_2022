# frozen_string_literal: true

require_relative '../cleanup'

RSpec.describe Cleanup do
  subject { described_class.new }

  context 'with the list of tasks' do
    let(:string) { '2-4,6-8' }

    it 'parses a single line to the correct output' do
      expect(subject.parse(string)).to eq([2, 4, 6, 8])
    end

    it 'creates the correct task lists' do
      task_list = [2, 4, 6, 9]
      task1 = subject.create_tasks(task_list)[0]
      task2 = subject.create_tasks(task_list)[1]
      expect(task1).to eq([2, 3, 4])
      expect(task1.size).to eq(3)
      expect(task2).to eq([6, 7, 8, 9])
      expect(task2.size).to eq(4)
    end
  end

  # before(:all) do
  #   let(:count) { 0 }
  # end

  context 'tasks that overlap completely' do
    # .2345678.  2-8
    # ..34567..  3-7
    let(:task1) { (2..8).to_a }
    let(:task2) { (3..7).to_a }

    it 'returns true and increases the final count by 1' do
      expect(subject.overlap?(task1, task2)).to be(true)
      expect(subject.complete_overlaps).to eq 1
    end
  end

  context "tasks don't overlap completely" do
    # ....567..  5-7
    # ......789  7-9
    let(:task1) { (5..7).to_a }
    let(:task2) { (7..9).to_a }

    it 'returns true and increase the final count' do
      expect(subject.partial_overlap?(task1, task2)).to be(true)
      expect(subject.partial_overlaps).to eq(1)
    end
  end

  context "tasks don't overlap at all" do
    # ....567..  5-7
    # ......789  7-9
    let(:task1) { (5..7).to_a }
    let(:task2) { (1..1).to_a }

    it 'returns false and does not increase the final count' do
      expect(subject.overlap?(task1, task2)).to be(false)
      expect(subject.total_overlaps).to eq(0)
    end
    end
end
