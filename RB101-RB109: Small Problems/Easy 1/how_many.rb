# how_many.rb
# Write a method that counts the number of occurrences of each element in a given
# array. The words in the array are case sensitive. Once counted, print each element
# alongside the number of occurrences.

# Pseudo-code:
# Take an array with any number of elements.
# Count the number of occurrences of each unique element.
# Store each unique element along with its number of occurences in a new object,
# like a hash.
# Print each element alongside its number of occurrences.

# Formal pseudo-code:
# START by defining a mehthod that takes an array as an argument.
# SET the unique elements of the array into a new array.
# READ the new array by iterating over each element and using a method to
# evaluate whether each element in the original array is equal to each element
# in the new array. The method should return an array of boolean values. The
# boolean values for each elment will be counted and the number should be 
# assigned as the value of a symbol-key of the unique element.
# SET each of the key-value pairs created above into a hash object.
# PRINT the hash object to the screen
# END

vehicles = [ 'car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
             'motorcycle', 'car', 'truck']

def count_occurrences(array)
  uniq_arr = array.uniq
  uniq_arr.each do |vehicle|
    a = array.map { |i| i == vehicle }
    b = a.select { |i| i == true }
    p c = vehicle.to_sym => b.length
  end
end

count_occurrences(vehicles)


