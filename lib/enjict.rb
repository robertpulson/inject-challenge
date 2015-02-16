class Array

  def enjict(*args)

    if args.length == 2 && args[0].is_a?(Fixnum) && args[1].is_a?(Symbol)
      start, symbol = args
    elsif args.length == 1
      raise ArgumentError unless args.first.is_a?(Symbol) || args.first.is_a?(Fixnum)
      symbol = args.first if args.first.is_a?(Symbol)
      start = args.first if args.first.is_a?(Fixnum)
    else
      raise ArgumentError unless block_given?
    end
    
    copiedArray = dup

    start = copiedArray.shift unless start
    
    if block_given?
      copiedArray.each { |num| start = yield(start, num) }
    else
      copiedArray.each { |num| start = start.send(symbol, num) }
    end
    start
  end
end


#array = [1, 2, 3]
#array.inject(:+) = 6
#array.inject{ |output, num| output + num } = 6
#array.inject(0, :+) = 6
#array.inject(0) { |output, num| output + num } = 6