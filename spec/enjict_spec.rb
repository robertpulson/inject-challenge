require 'enjict'

describe Array do

  let (:array) { [1, 2, 3] }

  it "it can receive a '+' and return the correct result" do
    expect(array.enjict(:+)).to eq(6)
  end

  it "can receive a '-' and return the correct result" do
    expect(array.enjict(:-)).to eq(-4)
  end

  it 'can receive an arg and a symbol and return the correct result' do
    expect(array.enjict(1, :+)).to eq(array.inject(1, :+))
  end

  it 'returns an error if no arguement is passed' do
    expect{ array.enjict }.to raise_error(ArgumentError)
  end

  it 'can receive two args, first = start, second = symbol' do
    expect(array.enjict(5, :+)).to eq(array.inject(5, :+))
  end

  it 'can receive a block and return same result as inject' do
    expect(array.enjict{ |sum, num| sum / num }).to eq(array.inject{ |sum, num| sum / num })
  end

  it 'can receive a block with an initial value and return the same result as inject' do
    expect(array.enjict(1){ |sum, num| sum / num }).to eq(array.inject(1){ |sum, num| sum / num })
  end

  it 'will return an error if two incorrect args are passed' do
    expect{ array.enjict(1,1) }.to raise_error(ArgumentError)
  end

  it 'will return an error if one incorrect arg is passed on its own' do
    expect{ array.enjict("string") }.to raise_error(ArgumentError)
  end

  it 'will return an error if three args are passed' do
    expect{ array.enjict(0, 1, :+) }.to raise_error(ArgumentError)
  end

end