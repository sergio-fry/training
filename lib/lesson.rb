require 'examples'
require 'tty/reader'


class Lesson
  def initialize
    @examples = Examples.new.all.sort_by { rand }
  end

  def current
    @current ||= next_example
  end

  def next_example
    result = @examples.sort_by(&:solved_time).reverse[0..10].sample
    
    if left > 1 && @current == result
      next_example
    else
      result
    end
  end

  def start
    reader = TTY::Reader.new

    until @examples.empty? do
      print current
      @start = Time.now

      if current.solution == read_solution
        current.solved_during(Time.now.to_f - @start.to_f)

        if current.success?
          @examples.delete current
          report_success
        end
      else
        Thread.new { `sayme ой` }
        # puts "#{current}#{current.solution}"
        current.failed
      end
      puts

      @current = next_example
    end
  end

  def left = @examples.size

  def read_solution
    reader = TTY::Reader.new
    chars = []

    current.solution.to_s.chars.size.times do
      chars << reader.read_char

      print chars.last
    end


    chars.join.to_i
  end

  def report_success
    print " " * 10 + left.to_s
  end
end
