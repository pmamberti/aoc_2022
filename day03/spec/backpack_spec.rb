# frozen_string_literal: true

require_relative '../backpack'

RSpec.describe Backpack do
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

  context 'assign priority' do
    # Lowercase item types a through z have priorities 1 through 26.
    # Uppercase item types A through Z have priorities 27 through 52
    it "assings a priority of X to 'a'" do
      expect(subject.priority('a')).to eq(1)
    end
    it "assings a priority of X to 'z'" do
      expect(subject.priority('z')).to eq(26)
    end
    it "assings a priority of X to 'A'" do
      expect(subject.priority('A')).to eq(27)
    end
    it "assings a priority of X to 'Z'" do
      expect(subject.priority('Z')).to eq(52)
    end
  end

  context 'authentic badges' do
    # The following two groups of badges should have `r` and `Z`
    # respectively as the authenticity badges
    # vJrwpWtwJgWrhcsFMMfFFhFp
    # jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
    # PmmdzqPrVvPwwTWBwg

    # wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
    # ttgJtRGJQctTZtZT
    # CrZsJsPPZsGzwwsLwLmpwMDw

    it 'returns "r" when looking at the first batch' do
      batch = %w[
        vJrwpWtwJgWrhcsFMMfFFhFp
        jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
        PmmdzqPrVvPwwTWBwg
      ]

      expect(subject.badge(batch)).to eq('r')
    end

    it 'returns "Z" when looking at the first batch' do
      batch = %w[
        wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
        ttgJtRGJQctTZtZT
        CrZsJsPPZsGzwwsLwLmpwMDw
      ]

      expect(subject.badge(batch)).to eq('Z')
    end
  end
end
