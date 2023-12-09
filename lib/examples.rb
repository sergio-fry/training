class Examples
  def all
    arr = []
    (1..9).each do |a|
      (1..9).each do |b|
        arr << Example.new(a, b)
      end
    end

    arr
  end
end
