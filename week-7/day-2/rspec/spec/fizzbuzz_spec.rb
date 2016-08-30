require_relative '../models/fizzbuzz'

# Unit test for fizzbuzz
describe "Fizzbuzz" do
  it "works correctly for numbers from 1 to 16" do
    answers = [
      nil, # don't care about 0
      "1",
      "2",
      "fizz",
      "4",
      "buzz",
      "fizz",
      "7",
      "8",
      "fizz",
      "buzz",
      "11",
      "fizz",
      "13",
      "14",
      "fizzbuzz",
      "16",
    ]

    (1..16).each do |number|
      expect(fizzbuzz(number)).to eq answers[number]
    end
  end

  it "outputs 1 for 1" do
    expect(fizzbuzz(1)).to eq "1"
  end

  it "outputs 2 for 2" do
    expect(fizzbuzz(2)).to eq "2"
  end

  it "outputs fizz for 3" do
    expect(fizzbuzz(3)).to eq "fizz"
  end

  it "outputs buzz for 5" do
    expect(fizzbuzz(5)).to eq "buzz"
  end

  it "outputs fizz for 6" do
    expect(fizzbuzz(6)).to eq "fizz"
  end

  it "outputs fizz for 9" do
    expect(fizzbuzz(9)).to eq "fizz"
  end

  it "outputs buzz for 10" do
    expect(fizzbuzz(10)).to eq "buzz"
  end

  it "outputs fizzbuzz for 15" do
    expect(fizzbuzz(15)).to eq "fizzbuzz"
  end

  it "outputs fizzbuzz for 30" do
    expect(fizzbuzz(30)).to eq "fizzbuzz"
  end
end
