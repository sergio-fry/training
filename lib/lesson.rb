# frozen_string_literal: true

require 'examples'
require 'tty/reader'

class Lesson
  def initialize
    @examples = Examples.new.all.sort_by { rand }
    @errors = 0
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
    @lesson_start = Time.now

    until @examples.empty?
      print current
      @example_start = Time.now

      try_to_solve

      @current = next_example
    end

    display_report
  end

  def display_report
    if @errors.positive?
      puts "Errors: #{@errors}"
    else
      puts 'No errors!'
    end

    puts "Time: #{(Time.now - @lesson_start).round}s"
  end

  def try_to_solve
    if check_solution
      mark_solved
    else
      mark_failed
    end
  end

  def check_solution = current.solution == read_solution

  def mark_solved
    current.solved_during(Time.now - @example_start)

    if current.success?
      @examples.delete current
      report_success
    end

    puts
  end

  def mark_failed
    Thread.new { `sayme ой` }
    # puts "#{current}#{current.solution}"
    current.failed
    puts
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
    print (' ' * 10) + left.to_s
  end
end
