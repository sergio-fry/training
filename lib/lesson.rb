# frozen_string_literal: true

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
    TTY::Reader.new
    @lesson_start = Time.now
    @errors = 0

    until @examples.empty?
      print current
      @example_start = Time.now

      if try_to_solve
        mark_solved
      else
        mark_failed
      end
      puts

      @current = next_example
    end

    if @errors.positive?
      puts "Errors: #{@errors}"
    else
      puts 'No errors!'
    end

    puts "Time: #{(Time.now - @lesson_start).round}s"
  end

  def try_to_solve = current.solution == read_solution

  def mark_solved
    current.solved_during(Time.now - @example_start)

    return unless current.success?

    @examples.delete current
    report_success
  end

  def mark_failed
    Thread.new { `sayme ой` }
    # puts "#{current}#{current.solution}"
    current.failed
    @errors += 1
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
    print ' ' * 10 + left.to_s
  end
end
