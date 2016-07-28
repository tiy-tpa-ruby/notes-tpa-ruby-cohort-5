array = ["abc", "bcd", "cde", "Gavin", "Toni", "☃☃☃"]

selected_items = array.select { |item| item.length > 2 }

# selected_items.each do |item|
#   puts "Found a matching item of #{item}"
# end
#
# if selected_items.empty?
#   puts "Didn't find anything!"
# end

puts array.count { |item| item.length > 3 }

# if array.all? { |item| item.length > 2 }
#   puts "All of them are longer than 2"
# end

# if array.any? { |item| item.length > 2 }
#   puts "Found one!"
# end

# mapped_items = array.map do |item|
#                  "My favorite is #{item.upcase}"
#                end
# p mapped_items
#
# mapped_items = array.map { |item| "My favorite is #{item.upcase}" }
# p mapped_items

# def awesome_find(array)
#   i = 0
#   while i < array.length do
#     local_variable_item = array[i]
#     was_found = yield(local_variable_item)
#     if was_found == true
#       return local_variable_item
#     end
#     i += 1
#   end
#
#   return nil
# end
#
# array_selected_items = array.select do |item|
#                          item.length == 4
#                        end
# p array_selected_items
#
# array_rejected_items = array.reject do |item|
#                          item.length == 4
#                        end
# p array_rejected_items

# awesome_found_item = awesome_find(array) do |item|
#                        item.length == 4
#                      end
# p awesome_found_item
# array_found_item = array.find do |item|
#                      puts "Thinking about #{item}"
#                      item.length > 2
#                    end
# p array_found_item

# def awesome_each(array)
#   i = 0
#   while i < array.length do
#     local_variable_item = array[i]
#     yield(local_variable_item)
#     i += 1
#   end
# end
#
# array = [1, 7, 9, "Gavin", "☃"]
#
# awesome_each(array) do |block_variable_item|
#   puts "awesome_each AWESOME!!!!! #{block_variable_item}"
#   puts "awesome_each AWESOME!!!!! #{block_variable_item}"
#   puts "awesome_each AWESOME!!!!! #{block_variable_item}"
#   puts "awesome_each AWESOME!!!!! #{block_variable_item}"
# end
#
# puts ""
# puts "-"*30
# puts ""
#
# array.each do |block_variable_item|
#   puts "Array#each AWESOME!!!!! #{block_variable_item}"
#   puts "Array#each AWESOME!!!!! #{block_variable_item}"
#   puts "Array#each AWESOME!!!!! #{block_variable_item}"
#   puts "Array#each AWESOME!!!!! #{block_variable_item}"
# end


# [1, 7, 9, "Gavin", "☃"].each do |item|
#   puts item
# end

# def bark
#   puts "Before"
#   yield
#   yield
#   puts "After"
# end
#
# bark do
#   name = gets.chomp
#   puts "#{name} Woof!"
# end
