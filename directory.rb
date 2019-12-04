def input_students
    students = []

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
        answer = gets.chomp
        if !answer.empty?
          puts "what is the name of the person?"
          name = gets.chomp
            if name.empty?
                name = "none"
            end

          puts "what cohort are they in?"
          cohort = months[gets.capitalize.chomp]
            while cohort == nil do
                puts "Try again: what cohort are they in?"
                cohort = months[gets.capitalize.chomp]
            end
          students << {name: name, cohort: cohort}
        else 
          break
        end
     end
     students   
end 

def print_header
    puts "The students of Villains Academy".center(50)
    puts "--------------".center(50)
end

def print(students)
  count = 0
  until count == students.length
    puts "Name : #{students[count][:name]}".center(25) + "Cohort: #{students[count][:cohort]}".center(25)
    count +=1
  end
end

def print_by_cohort(students)
  puts "Which cohort would you like?"
  value = gets.chomp.downcase
    students.each do |student|
      puts student[:name] if student[:cohort] == value.to_sym
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students".center(50)
end
#nothing happens until call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_by_cohort(students)




