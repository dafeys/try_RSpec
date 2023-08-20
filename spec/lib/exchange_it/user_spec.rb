# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  let(:user) { described_class.new 'John', 'Doe' }
  let(:user_numeric) { described_class.new 122, 133 }

  it 'returns name' do
    expect(user.name).to eq('John')
  end

  it 'returns name as a string' do
    expect(user_numeric.name).to be_an_instance_of(String)
  end

  it 'returns surname' do
    expect(user.surname).to eq('Doe')
  end

  it 'returns surname as a string' do
    expect(user_numeric.surname).to be_an_instance_of(String)
  end
end
