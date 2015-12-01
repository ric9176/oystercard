
class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "Your balance is too low. Please top up!" if balance < MINIMUM_FARE
    @entry_station = station
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @entry_station = nil
  end

  def top_up(amount)
    raise "card limit of #{MAXIMUM_BALANCE} exceeded" if limit_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def limit_exceeded?(amount)
    amount + balance() > MAXIMUM_BALANCE
  end

  def limit_too_low?(amount)
    balance() - amount < 0
  end

end
