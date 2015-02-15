class Array

  def copy
      self.dup
  end

      # def injector(&block)
      #   copiedArray = copy
      #   a = copiedArray.shift
      #     copiedArray.each do |b|
      #       a = block.call(a, b)
      #     end
      #   a
      # end  

      # def injector(start=nil, symbol)
      #   output = start 
      #   output = copy[0] if start == nil 
      #   i = 0
      #   i = 1 if start == nil
        
      #   while i < copy.length
      #     output = output.send(symbol, copy[i])
      #     i = i + 1
      #   end 
      #   output
      # end

end