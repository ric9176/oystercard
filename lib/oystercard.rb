class Oystercard

  attr_reader :balance, :station, :history

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = MIN_BALANCE

  def initialize
    @balance = 0
    @station = nil
    @history = {}
    @journey = []

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
    @journey << station
  end

  def touch_out(exit_station)
    @journey << exit_station
    history[:journey1] = [station, exit_station]
    @station = nil
    @journey = []

    deduct(MIN_FARE)
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
