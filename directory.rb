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
    students << {name: name, cohort: :november, hobby: :tennis, height: "6ft"}
    puts "Now we have #{students.count} students"
    #obtain another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------"
end

def print(students)
  count = 1
  until count == students.length+1
    current = students[count-1]
    puts "#{count}. #{current[:name]} - #{current[:hobby]} - #{current[:height]}"
    count += 1
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students."
end

students = input_students
print_header
print(students)
print_footer(students)
