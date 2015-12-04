require_relative 'journey'
class Oystercard

  attr_reader :balance, :history, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @history = {}
    @journey = Journey.new
  end

  def in_journey?
    journey[:entry] != nil && journey[:exit] == nil
  end

  def touch_in(station)
    fail 'Your balance is too low. Please top up!' if balance < MINIMUM_FARE
    journey.update_entry(station)
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    journey.update_exit(station)
    update_history(journey)
    new_journey
  end

  def update_history(journey)
    history[:"journey#{index}"] = journey.current_journey
  end

  def top_up(amount)
    raise "card limit of #{MAXIMUM_BALANCE} exceeded" if limit_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def index
    history.count + 1
  end

  def new_journey
    @journey = Journey.new
  end

  private

  def limit_exceeded?(amount)
    amount + balance() > MAXIMUM_BALANCE
  end

  def limit_too_low?(amount)
    balance() - amount < 0
  end

end
