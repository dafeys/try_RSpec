# frozen_string_literal: true

describe FactorialCalculator do
  let(:calculator) { described_class.new }

  describe '#factorial_of' do
    context 'given 5' do
      it 'returns 120' do
        expect(calculator.factorial_of(5)).to eq(120)
      end
    end
  end
end
