@students = [] #an empty array accessible to all methods

#Interactive Menu Method
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

#Method for printing the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

#Process method - decides what to do based on user input
def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
    puts "I don't know what you meant, try again."
  end
end

#Method that prints the menu
def show_students
  print_header
  print_students_list
  print_footer
end


# Method to obtain information about the students
def input_students
  puts "Please enter the names and cohorts of the students"
  puts "To finish, just hit return at name entry"

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
    @students << hash
    info = info_getter
  end
end

#Method that will actually obtain the information
def info_getter
  output = []
  go = ""
  until go == "Y"
    puts "Please enter a name or return to finish"
    output[0] = gets.chomp.to_sym
    return output if output[0].empty?
    puts "Please enter #{output[0]}'s cohort"
    output[1] = gets.chomp.to_sym
    puts "You entered Name: #{output[0]} and Cohort: #{output[1]}, is this correct?"
    puts "If correct type Y, if you would like to enter again press any key."
    go = gets.chomp
  end
  output
end

#Method to print the header
def print_header
  puts "The students of Villains Academy".center(80)
  puts "--------------".center(80)
end

#Method to print all students out as they were entered
def print_students_list
  if @students.length > 0
    count = 1
    until count == @students.length+1
      current = @students[count-1]
      puts "#{count}. #{current[:name]} - #{current[:cohort]}".center(80)
      count += 1
    end
  else
    puts "You didn't enter any students, there's no list to print.".center(80)
  end
end

#Methd to print students by cohort
def print_cohorts

  student_cohorts = @students.map { |n| n[:cohort] }.uniq
  counter = 0

  if @students.length > 0
    while counter != student_cohorts.length
      @students.each do |n|
        if student_cohorts[counter] == n[:cohort]
          puts "#{n[:name]} - #{n[:cohort]} cohort".center(80)
        else
          false
        end
      end
      counter += 1
    end
  else
    puts "You didn't enter any students, there's no list to print.".center(80)
  end
end


#Method to print footer
def print_footer
  if @students.length > 1
    puts "Overall we have #{@students.count} great students.".center(80)
  elsif @students.length == 1
    puts "Overall we have #{@students.count} great student.".center(80)
  else
    false
  end
end

#Method for saving students to .csv file
def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "#{@students.length} students written to students.csv".center(80)
  file.close
end

#Method for reading students from students.csv
def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "Loaded #{@students.length} students from students.csv".center(80)
end

interactive_menu
