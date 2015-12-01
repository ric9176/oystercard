
class Oystercard

  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "card limit of #{MAXIMUM_BALANCE} exceeded" if limit_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    raise "you don't have enough money" if limit_too_low?(amount)
    @balance -= amount
  end

  #private

  def limit_exceeded?(amount)
    amount + balance() > MAXIMUM_BALANCE
  end

  def limit_too_low?(amount)
    balance() - amount < 0
  end

end
