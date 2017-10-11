@students = [] #an empty array accessible to all methods

#Interactive Menu Method
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

#Method for printing the menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to File"
  puts "4. Load the list from File"
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

#Method to push a new student and cohort into the students array
def push_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

#Method to input students
def input_students
  puts "Please enter a student name".center(80)
  puts "To finish, just hit return at name entry".center(80)
  name = STDIN.gets.chomp
  counter = 0
  while !name.empty?
    counter += 1
    cohort = input_cohort
    push_to_students(name, cohort)
    puts "Please enter another name or return to finish".center(80)
    name = STDIN.gets.chomp
  end
  if counter > 1
    puts "#{counter} students added to list,".center(80)
    puts "#{@students.length} students in list".center(80)
  elsif counter == 1
    puts "#{counter} student added to list".center(80)
    puts "#{@students.length} students in list".center(80)
  else
    puts "No students added to list".center(80)
  end
end

#Method to input cohort
def input_cohort
  puts "Enter their cohort".center(80)
  cohort = STDIN.gets.chomp.to_sym

  if cohort.empty?
    cohort = :none
  end
  cohort
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
  puts "Which file would you like to save to?"
  to_save = gets.chomp
  file = File.open(to_save, "w") #open the file fro writing
  @students.each do |student| #iterate over the students array
    student_data = [student[:name], student[:cohort]]
    file.puts student_data.join(",")
  end
  puts "#{@students.length} students written to students.csv".center(80)
  file.close
end

#Method for reading students from students.csv
def load_students
  puts "Which file would you like to load from?".center(80)
  filename = gets.chomp
  until File.exist?(filename)
    puts "That file doesn't exist, try again"
    filename = gets.chomp
  end
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    push_to_students(name, cohort)
  end
  file.close
  puts "Loaded #{@students.length} students from #{filename}".center(80)
end

#Method for loading a file entered as an argument from the command line
def try_load_students
  filename = ARGV.first #first argument from the command line
  filename = "students.csv" if filename.nil? #Load students.csv if filename isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist.".center(80)
    exit
  end
end

#try_load_students
interactive_menu
