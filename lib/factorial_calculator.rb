# frozen_string_literal: true

class FactorialCalculator
  def factorial_of(n)
    (1..n).inject(:*)
  end
end
