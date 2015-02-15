require 'injector'

describe Array do

  let (:array) { Array.new }

  def fill_array
    array = [1, 2, 3]
  end

  it 'can make a copy of the array' do
    fill_array
    expect(array.copy).to eq(array)
  end

  it "it can receive a '+' and return the correct result" do
    fill_array
    expect(array.injector(:+)).to eq(array.inject(:+))
  end

  it "can receive a '-' and return the correct result" do
    fill_array
    expect(array.injector(:-)).to eq(array.inject(:-))
  end

  it 'returns an error if no arguement is passed' do
    fill_array
    expect{ array.injector }.to raise_error(ArgumentError)
  end

  it 'can receive two args, first = start, second = symbol' do
    fill_array
    expect(array.injector(5, :+)).to eq(array.inject(5, :-))
  end

  it 'can receive a block and return same result as inject' do
    fill_array
    expect(array.injector{ |sum, num| sum / num }).to eq(array.inject{ |sum, num| sum / num })
  end

  it 'can receive a block with an initial value and return the same result as inject' do
    fill_array
    expect(array.injector(1){ |sum, num| sum / num }).to eq(array.inject(1){ |sum, num| sum / num })
  end

end