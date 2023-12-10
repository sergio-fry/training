# frozen_string_literal: true

class Division
  def initialize(dividend, divisor)
    @dividend = dividend
    @divisor = divisor
  end

  def to_s = "#{@dividend} / #{@divisor} = "

  def solution
    @dividend / @divisor
  end
end
