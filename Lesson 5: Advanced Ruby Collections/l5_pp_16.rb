# l5_pp_16.rb

# Practice Problem 16
# A UUID is a type of identifier often used as a way to uniquely identify
# items...which may not all be created by the same system. That is, without any
# form of synchronization, two or more separate computer systems can create new
# items and label them with a UUID with no significant chance of stepping on
# each other's toes.

# It accomplishes this feat through massive randomization. The number of
# possible UUID values is approximately 3.4X 10E38.

# Each UUID consists of 32 hexadecimal characters, and is typically broken into
# 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: `"f65c57f6-a6aa-1718-faa1-a67f2dc9fa91"`

# Write a method that returns one UUID when called with no parameters.

def hex_sample(length)
  hex = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
         'a', 'b', 'c', 'd', 'e', 'f']
  hex.sample(length).join('')
end


def uuid
  "#{hex_sample(8)}-#{hex_sample(4)}-#{hex_sample(4)}-#{hex_sample(4)}-#{hex_sample(12)}"
end

puts uuid

puts '-------'

# Launch School solution:

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts generate_UUID
