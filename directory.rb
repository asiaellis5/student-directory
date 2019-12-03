def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do 
        # add the student has to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end

    puts "Please enter each of the students hobbys?"
    hobby = gets.chomp
    while !hobby.empty? do
        students.each do |hash|
            hash[:hobby] = hobby
            hobby = gets.chomp
        end 
    end

    puts "Whats the country of Birth?"
    country = gets.chomp
    while !country.empty? do
      students.each do |hash|
        hash[:country_of_birth] = country
        country = gets.chomp
      end
    end
        #return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "--------------"
end
def print(students)
  count = 0
  until count >= students.length
    puts "#{students[count][:name]}, #{students[count][:hobby]}, #{students[count][:country_of_birth]} (#{students[count][:cohort]} cohort)"
    count +=1
  end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end
#nothing happens until call the methods
students = input_students
print_header
print(students)
print_footer(students)



