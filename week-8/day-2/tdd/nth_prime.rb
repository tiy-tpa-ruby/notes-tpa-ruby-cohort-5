require 'minitest/autorun'

require 'prime'

# Return the nth prime
def nth_prime(nth)
  (1...Float::INFINITY).lazy.select(&:prime?).drop(nth-1).first
end

describe "Nth Prime" do
  it "tests for nth primes" do
    [
      [1, 2],
      [2, 3],
      [6, 13],
      [10_001, 104_743],
      # [1_000_000, 15_485_863],
    ].each do |n, prime|
      assert_equal prime, nth_prime(n)
    end
  end
end
