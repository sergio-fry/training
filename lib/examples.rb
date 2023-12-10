# frozen_string_literal: true

require 'example'
require 'multiplication'
require 'division'

class Examples
  def all
    multiplications = []
    divisions = []

    (2..9).each do |a|
      (2..9).each do |b|
        multiplications << Example.new(Multiplication.new(a, b))
        divisions << Example.new(Division.new(a * b, a))
      end
    end

    arr1 = multiplications.sort_by { rand }.take(10)
    arr2 = divisions.sort_by { rand }.take(10)

    (arr1 + arr2)
  end

end
