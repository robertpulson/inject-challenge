class Array

  def enjict(*args)

    if args.length == 2 && args[0].is_a?(Fixnum) && args[1].is_a?(Symbol)
      start, symbol = args
    elsif args.length == 1 && (args[0].is_a?(Fixnum) || args[0].is_a?(Symbol))
      symbol = args.first if args.first.is_a?(Symbol)
      start = args.first if args.first.is_a?(Fixnum)
    else
      raise ArgumentError unless block_given?
    end
    
    copiedArray = dup
    output = start ? start : copiedArray.shift
    block = symbol unless block_given?
    copiedArray.each { |num| output = output.send(block, num) }; output
  end
end