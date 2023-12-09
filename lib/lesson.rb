require 'examples'

class Lesson
  def initialize
    @examples = Examples.new.all
  end

  def current
    @current ||= next_example
  end

  def next_example = @examples.sort_by(&:solved_time)[0..10].sample
end
