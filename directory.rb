=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Kreuger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #obtain input from the user
  name = gets.chomp
  #while name is NOT empty execute the following code
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #obtain another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

=begin
def sort_by_letter
  puts "Would you like to return students names that begin with a certain letter?"
  puts "If so please enter that letter now, otherwise hit return"
  sort = gets.chomp
end
=end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  counter = 1
  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{counter}. #{student[:name]} (#{student[:cohort]} cohort)"
      counter += 1
    end
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
