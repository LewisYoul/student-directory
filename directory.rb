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

#Method to push a new student and cohort into the students array
def push_to_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

#Method to input students
def input_students
  puts "Please enter a student name"
  puts "To finish, just hit return at name entry"
  name = STDIN.gets.chomp

  while !name.empty?
    cohort = input_cohort
    push_to_students(name, cohort)
    puts "Please enter another name or return to finish"
    name = STDIN.gets.chomp
  end
end

#Method to input cohort
def input_cohort
  puts "Enter their cohort"
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
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    push_to_students(name, cohort)
  end
  file.close
  puts "Loaded #{@students.length} students from students.csv".center(80)
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if a filenme isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu
