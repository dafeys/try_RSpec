# frozen_string_literal: true

RSpec.describe ExchangeIt::Account do
  let(:user_class) { Struct.new(:name, :surname) }
  let(:john) { described_class.new(user_class.new('John', 'Doe')) }
  let(:ann) { described_class.new(user_class.new('Anna', 'Morgan')) }

  it 'has zero balance', fast: true do
    expect(john.balance).to eq(0)
  end

  it 'has proper uid', fast: true do
    expect(john.uid).to eq(Digest::MD5.hexdigest('John Doe'))
  end

  describe '#deposit', fast: true do
    it 'allows to deposit correct sum' do
      ann.deposit 30
      expect(ann.balance).to eq(30)
    end

    it 'does not allow to deposit a negarive sum' do
      expect { ann.deposit(-140) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
    end

    it 'does not allow to deposit a zero' do
      expect { ann.deposit(0) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
    end
  end

  context 'when performing money withdrawal' do
    before { john.deposit 100 }

    specify '#transfer' do
      # john.deposit 100
      expect(ann.balance).to eq(0)

      john.transfer ann, 30
      expect(john.balance).to eq(70)
      expect(ann.balance).to eq(30)
    end

    describe '#withdraw' do
      it 'allows to withdraw correct sum' do
        john.withdraw 40
        expect(john.balance).to eq(60)
      end

      it 'does not allow to withdraw if a sum is too large' do
        expect { john.withdraw(150) }.to raise_error(ExchangeIt::NotEnoughFunds, /Available: 100/)
      end

      it 'does not allow to withdraw a negative sum' do
        expect { john.withdraw(-1500) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
      end

      it 'does not allow to withdraw a zero sum' do
        expect { john.withdraw(0) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
      end
    end
  end
end
