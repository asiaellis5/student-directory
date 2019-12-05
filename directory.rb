@students = [] # an empty array accessible to all methods

def input_students

    months = {
        "" => :none,
        "January" => :january,
        "February" => :february,
        "March" => :march,
        "April" => :april,
        "May" => :may,
        "June" => :june,
        "July" => :july,
        "August" => :august,
        "September" => :september,
        "October" => :october,
        "November" => :november,
        "December" => :december
        }
    
     while true do
     puts "Would you like to add a new person yes or no, if no hit return twice."
        answer = STDIN.gets.strip
        if !answer.empty?
          puts "what is the name of the person?"
          name = STDIN.gets.strip
            if name.empty?
                name = "none"
            end

          puts "what cohort are they in?"
          cohort = months[STDIN.gets.capitalize.strip]
            while cohort == nil do
                puts "Try again: what cohort are they in?"
                cohort = months[STDIN.gets.capitalize.strip]
            end
          add_students(name, cohort)
        else 
          break
        end
     end  
end 

def print_header
    puts "The students of Villains Academy".center(50)
    puts "--------------".center(50)
end

def print_students_list
  if @students.empty?
    puts "You dont have any students".center(50)
  else
    count = 0
    until count == @students.length
      puts "Name : #{@students[count][:name]}".center(25) + "Cohort: #{@students[count][:cohort]}".center(25)
    count +=1
    end
  end
end

def print_by_cohort
  if @students.length > 0
  puts "Which cohort would you like?"
  value = STDIN.gets.strip.downcase
    @students.each do |student|
      puts student[:name] if student[:cohort] == value.to_sym
    end
  end
end

def print_footer
   if @students.length == 1
    puts "Overall, we have #{@students.count} great student".center(50)
   else 
    puts "Overall we have #{@students.count} great students".center(50)
   end
end



def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header 
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students 
    when "4"
      @students = []
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean sorry" 
    end
  end

  def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

  def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort)
    end
    file.close
  end

  def try_load_students
    filename = ARGV.first
    if filename.nil?
      load_students
      puts "Loaded #{@students.count} from students.csv"
    elsif File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
      exit
    end
  end

  def add_students(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
  end

try_load_students
interactive_menu




