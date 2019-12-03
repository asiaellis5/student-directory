def input_students
    students = []
    
     while true do
     puts "Would you like to add a new person yes or no, if no hit return twice."
        answer = gets.chomp
        if !answer.empty?
        puts "what is the name of the person?"
        name = gets.chomp
    
        puts "What is that persons hobby?"
        hobby = gets.chomp
    
        puts "Where were they born?"
        country = gets.chomp
    
        puts "what cohort are they in?"
        cohort = gets.chomp
        
        students << {name: name, hobby: hobby, country_of_birth: country, cohort: cohort}
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
    puts "#{students[count][:name]}, #{students[count][:hobby]}, #{students[count][:country_of_birth]} (#{students[count][:cohort]} cohort)".center(50)
    count +=1
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



