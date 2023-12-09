require 'examples'
require 'tty/reader'


class Lesson
  def initialize
    @examples = Examples.new.all
  end

  def current
    @current ||= next_example
  end

  def next_example
    @examples.sort_by(&:solved_time).reverse[0..10].sample
  end

  def start
    reader = TTY::Reader.new

    loop do
      print current
      @start = Time.now

      if current.solution == read_solution
        puts ""
        current.solved_during(Time.now.to_f - @start.to_f)
      else
        puts " WRONG"
        puts "#{current}#{current.solution}"
        current.failed
      end

      @current = next_example
    end
  end

  def read_solution
    reader = TTY::Reader.new
    chars = []

    current.solution.to_s.chars.size.times do
      chars << reader.read_char

      print chars.last
    end


    chars.join.to_i
  end
end
