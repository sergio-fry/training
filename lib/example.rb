class Example
  attr_reader :solved_time

  def initialize(a, b, solved_time: 100)
    @a = a
    @b = b

    @solved_time = solved_time
  end

  def solved_during(time)
    @solved_time = time
  end

  def failed
    @solved_time = 100
  end
  
  def to_s = "#{@a} x #{@b} = "

  def solution
    @a * @b
  end
end
