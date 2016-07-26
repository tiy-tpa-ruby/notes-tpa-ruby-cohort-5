# * repeatedly ask for numbers
# * if the number is blank, stop
# *when done, print*  _total, print average_

total = 0.0
count = 0

loop do
  puts "Give me a number"
  number = gets.chomp
  if number.empty?
    break
  end
  total = total + number.to_f
  count = count + 1
end

puts "The total is #{total}"
puts "The average is #{total/count}"
