require_relative 'journey'
class Oystercard

  attr_reader :balance, :station, :history

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = MIN_BALANCE

  def initialize
    @balance = 0
    @station = nil
    @history = {}
    @journey = Journey.new

  end

  def top_up(money)
    fail "the balance cannot be over #{MAX_BALANCE} pounds" if excessive_balance?(money)
    @balance += money
  end

  def in_journey?
    !!station
  end

  def touch_in(station)
    fail "cannot touch in if balance is less #{MIN_BALANCE} pound" if insufficent_balance?
    @station = station
    @journey.entry_station=(station)
  end

  def touch_out(station)
    @journey.exit_station=(station)
    history[:"journey#{index}"] = @journey
    @station = nil
    @journey = Journey.new

    deduct(MIN_FARE)
  end

  def index
    history.count + 1
  end

  private

  def excessive_balance?(money)
    @balance + money > MAX_BALANCE
  end

  def insufficent_balance?
    @balance < MIN_BALANCE
  end


  def deduct(money)
    @balance -= money
  end

end
