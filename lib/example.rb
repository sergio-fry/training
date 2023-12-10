# frozen_string_literal: true

class Example
  attr_reader :solved_time

  def initialize(problem)
    @problem = problem
    @solved_time = 100
  end

  def solved_during(time)
    @solved_time = time
  end

  def success?
    @solved_time <= 6
  end

  def failed
    @solved_time = 100
  end

  def to_s = @problem.to_s
  def solution = @problem.solution
end
