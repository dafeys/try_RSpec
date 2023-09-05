# frozen_string_literal: true

module ExchangeIt
  class Account
    include ExchangeIt::Utils::Uid

    attr_reader :uid, :balance

    def initialize(user)
      @uid = hash user.name, user.surname
      @balance = 0
    end

    def transfer(receiver, amount)
      withdraw amount
      receiver.deposit amount
    end

    # private

    def withdraw(amount)
      raise(ExchangeIt::IncorrectSum, 'Amount must be positive!') unless amount.positive?
      raise(ExchangeIt::NotEnoughFunds, "Available: #{@balance} but tried #{amount}") if amount > @balance

      @balance -= amount
    end

    def deposit(amount)
      raise(ExchangeIt::IncorrectSum, 'Amount must be positive!') unless amount.positive?

      @balance += amount
    end
  end
end
