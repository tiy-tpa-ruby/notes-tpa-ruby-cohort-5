require "minitest/autorun"

class Calculator
  def add(number1, number2)
    number1 + number2
  end

  def subtract(number1, number2)
    number1 - number2
  end
end

# Demoing TDD
class TestAddition < Minitest::Test
  def test_adding_two_plus_two
    calculator = Calculator.new
    answer = calculator.add(2,2)
    assert_equal 4, answer
  end

  def test_adding_three_plus_three
    calculator = Calculator.new
    answer = calculator.add(3,3)
    assert_equal 6, answer
  end

  def test_adding_three_and_seven
    calculator = Calculator.new
    answer = calculator.add(3,7)
    assert_equal 10, answer
  end

  def test_subtracting_two_from_four
    calculator = Calculator.new
    answer = calculator.subtract(4,2)
    assert_equal 2, answer
  end

  def test_subtracting_three_from_nine
    calculator = Calculator.new
    answer = calculator.subtract(9,3)
    assert_equal 6, answer
  end
end
