# frozen_string_literal: true

# require "string_calculator"

describe StringCalculator do
  describe '.add' do
    context 'given an empty stirng' do
      it 'returns zero' do
        expect(described_class.add('')).to eq(0)
      end
    end

    context "given '4'" do
      it 'returns 4' do
        expect(described_class.add('4')).to eq(4)
      end
    end

    context "given '10'" do
      it 'returns 10' do
        expect(described_class.add('10')).to eq(10)
      end
    end

    context 'two numbers' do
      context 'given 2,4' do
        it 'return 6' do
          expect(described_class.add('2,4')).to eq(6)
        end
      end

      context 'given 17, 100' do
        it 'returns 117' do
          expect(described_class.add('17,100')).to eq(117)
        end
      end
    end
  end
end
