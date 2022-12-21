# frozen_string_literal: true

require_relative '../day_03-01'

RSpec.describe FindMisplaced do
  subject { described_class }

  context 'find the item out of place' do
    it '"p" is out of place in vJrwpWtwJgWrhcsFMMfFFhFp' do
      expect(described_class.check('vJrwpWtwJgWrhcsFMMfFFhFp')).to eq('p')
    end

    it '"L" is out of place in jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL' do
      expect(described_class.check('jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL')).to eq('L')
    end

    it '"P" is out of place in PmmdzqPrVvPwwTWBwg' do
      expect(described_class.check('PmmdzqPrVvPwwTWBwg')).to eq('P')
    end

    it '"v" is out of place in wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn' do
      expect(subject.check('wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn')).to eq('v')
    end

    it '"t" is out of place in ttgJtRGJQctTZtZT' do
      expect(subject.check('ttgJtRGJQctTZtZT')).to eq('t')
    end

    it '"s" is out of place in CrZsJsPPZsGzwwsLwLmpwMDw' do
      expect(subject.check('CrZsJsPPZsGzwwsLwLmpwMDw')).to eq('s')
    end
  end
end
