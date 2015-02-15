require "injector"

describe Array do

  let (:array) {Array.new}

  def fill_array
    array = [1, 2, 3]
  end

  it "can make a copy of the array" do
    fill_array
    expect(array.copy).to eq(array)
  end

  it "it can receive a '+'' and return a sum of the array" do
    array = [1, 2, 3]
    expect(array.injector(:+)).to eq(6)
  end

  it "can receive a '-' and return the correct result" do
    array = [1, 2, 3]
    expect(array.injector(:-)).to eq(-4)
  end

  it "returns an error if no arguement is passed" do
    expect{ array.injector }.to raise_error(ArgumentError)
  end

  it "can receive two args, first = start, second = symbol" do
    array = [1, 2, 3]
    expect(array.injector(5, :+)).to eq(11)
  end

  it "can receive a block and return same result as inject" do
    array = [1, 2, 3]
    expect(array.injector{ |sum, num| sum / num }).to eq(array.inject{ |sum, num| sum / num })
  end

end