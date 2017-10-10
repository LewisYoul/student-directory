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
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return at name entry"

  students = []
  info = info_getter
  #converted from .each iteration
  while !info[0].empty? do
    hash = Hash.new { |this_hash, key| this_hash[key] = :none }
    hash[:name] = info[0]
    if info[1].empty?
      hash[:cohort]
    else
      hash[:cohort] = info[1]
    end
    students << hash
    info = info_getter
  end
  #return the array of students
  students
end

def info_getter
  output = []
  go = ""
  until go == "Y"
    puts "Please enter a name"
    output[0] = gets.chomp.to_sym
    return output if output[0].empty?
    puts "Please enter #{output[0]}'s cohort"
    output[1] = gets.chomp.to_sym
    puts "You entered Name: #{output[0]} and Cohort: #{output[1]}, is this correct?"
    puts "If correct type Y, if you would like to enter again type N"
    go = gets.chomp
  end
  output
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "--------------".center(100)
end

def print(students)
  count = 1
  until count == students.length+1
    current = students[count-1]
    puts "#{count}. #{current[:name]} - #{current[:cohort]}".center(100)
    count += 1
  end
end

def print_footer(students)
  if students.length == 1
    puts "Overall we have #{students.count} great student.".center(100)
  else
    puts "Overall we have #{students.count} great students.".center(100)
  end
end

students = input_students
print_header
print(students)
print_footer(students)
