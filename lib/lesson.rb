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
        puts "    #{left}"

        if current.success?
          Thread.new { `sayme молодец` }
          @examples.delete current
        end
      else
        print "    ERR"
        puts
        Thread.new { `sayme ошибка` }
        # puts "#{current}#{current.solution}"
        current.failed
      end

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
end
