# frozen_string_literal: true

require 'example'
require 'multiplication'
require 'division'

class Examples
  def all
    arr = []
    (2..9).each do |a|
      (2..9).each do |b|
        arr << Example.new(Multiplication.new(a, b))
        # arr << Example.new(Division.new(a * b, a))
      end
    end

    arr
  end
end
