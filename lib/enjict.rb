class Array

  def enjict(*args)

    if args[0].is_a?(Fixnum) && args[1].is_a?(Symbol)
      start, symbol = args
    elsif args.length == 1
      raise ArgumentError unless args.first.is_a?(Symbol) || args.first.is_a?(Fixnum)
      symbol = args.first if args.first.is_a?(Symbol)
      start = args.first if args.first.is_a?(Fixnum)
    else
      raise ArgumentError unless block_given?
    end
    
    copiedArray = dup
    if start
      output = start
    else
      output = copiedArray.shift
    end
    if block_given?
      copiedArray.each { |num| output = yield(output, num) }
    else
      copiedArray.each { |num| output = output.send(symbol, num) }
    end
    output
  end
end