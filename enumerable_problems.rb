#question - 1

fruits = ["apple", "banana", "cherry"]
fruits.append("date")

#1b
fruits = ["apple", "banana", "cherry"]
fruits.pop
fruits

#question - 2

colors = ["red", "green", "blue"]
b = ["yellow"]
b.concat(colors)

colors = ["red", "green", "blue"]
colors.unshift("yellow")
#2b
colors = ["red","green","blue"]
colors.shift
colors

colors = ["red","green","blue"]
colors.delete_at(0)
colors
#question - 3

numbers = [1, 2, 3, 4, 5]
numbers.count

numbers = [1, 2, 3, 4, 5]
numbers.length

numbers = [1, 2, 3, 4, 5]
numbers.size


#question - 4

grades = [90, 85, 78, 92, 88]
grades.include? 29
#4b
grades = [90, 85, 78, 92, 88]
grades.select { |mark| mark<60}

grades = [90, 85, 78, 92, 88]
grades.any? { |mark| mark<60}


#question - 5

words = ["Hello", "world", "Ruby"]
words.join(" ")
#5b
words = ["Hello", "world", "Ruby"]
words.join("")

#question - 6

numbers = [5, 2, 9, 1, 4]
numbers.sort
#6b
numbers = [5, 2, 9, 1, 4]
numbers.reverse


#question - 7

number
s = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4]
numbers.uniq
#7b
#What is the result of a method to remove duplicates, and how is it different from the original `numbers` array?
  #[1, 2, 3, 4] => result
  #[1, 2, 2, 3, 3, 3, 4, 4, 4, 4] => original array


#question - 8

def func_hash(h)
  h.keys.any? {|key| key.is_a?(Integer)}
end
func_hash({"a" => 1, "b" => 2, "c" => 3})

#question - 9

def func_hash(h)
  h.values.all? {|value| value.is_a?(Integer) && value<10}
end
func_hash({"a" => 1, "b" => 2, "c" => 3})

#question - 10

def func_hash(h)
  h.values.none?{|value| value.nil?}
end
func_hash({"a" => 1, "b" => 2, "c" => 3})

#question - 11

def func_hash(h)
  found = h.find {|key,value| key.is_a?(Integer) && value.is_a?(Integer) && value<20} && 
           h.find {|key,value| key.is_a?(String)  && value.is_a?(String) && value.start_with("a")}
  found.nil? ? "not found" : "found"
end
func_hash({"a" => 1, "b" => 2, "c" => 3})
