# Open array class to add 'enjict' method
class Array
  def enjict(*args)
    if args.length == 2 && args[0].is_a?(Fixnum) && args[1].is_a?(Symbol)
      start, symbol = args
    elsif args.length == 1
      fail ArgumentError unless args.first.is_a?(Symbol) || args.first.is_a?(Fixnum)
      symbol = args.first if args.first.is_a?(Symbol)
      start = args.first if args.first.is_a?(Fixnum)
    else
      fail ArgumentError unless block_given?
    end

    copied_array = dup

    start = copied_array.shift unless start

    if block_given?
      copied_array.each { |num| start = yield(start, num)       }
    else
      copied_array.each { |num| start = start.send(symbol, num) }
    end
    start
  end
end
