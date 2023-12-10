# frozen_string_literal: true

require 'example'
require 'multiplication'

class Examples
  def all
    arr = []
    (1..2).each do |a|
      (1..1).each do |b|
        arr << Example.new(Multiplication.new(a, b))
      end
    end

    arr
  end
end
