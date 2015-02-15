class Array

  def copy
    dup
  end

  def injector(*args)
    if args.length == 2
      start, symbol = args
    elsif args.length == 1
      symbol = args.first if args.first.is_a?(Symbol)
      start = args.first if args.first.is_a?(Fixnum)
    else
      raise ArgumentError unless block_given?
    end
    
    symbol = args[1] if args.length > 1
    if block_given?
      copiedArray = copy
      if start
        a = start
      else
        a = copiedArray.shift
      end
      copiedArray.each do |b|
        a = yield(a, b)
      end
      a
    else
      output = copy[0]
      output = start if start
      i = 0
      i = 1 unless start
      
      while i < copy.length
        output = output.send(symbol.to_proc, copy[i])
        i = i + 1
      end 
      output
    end
  end

end