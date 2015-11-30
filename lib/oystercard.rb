

class Oystercard

  DEFAULT_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "£90 maximum limit would be exceeded!" if limit_reached?(amount)
    @balance += amount
  end

def limit_reached?(amount)
  (@balance + amount) >= 90
end

end
