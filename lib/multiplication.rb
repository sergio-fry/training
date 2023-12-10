# frozen_string_literal: true

class Multiplication
  def initialize(multiplier, multiplicand)
    @multiplier = multiplier
    @multiplicand = multiplicand
  end

  def to_s = "#{@multiplier} x #{@multiplicand} = "

  def solution
    @multiplier * @multiplicand
  end
end
