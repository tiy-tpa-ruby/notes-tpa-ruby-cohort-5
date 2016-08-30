def fizzbuzz(number)
  if number % 3 == 0 && number % 5 == 0
    "fizzbuzz"
  else
    if number % 3 == 0
      "fizz"
    else
      if number % 5 == 0
        "buzz"
      else
        number.to_s
      end
    end
  end
end
