#first we print the list of students
students = [
 "Dr Hannibal Lecter",
 "Darth Vader",
"Nurse Ratched",
 "Michael Corleone",
 "Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"]
#print the names
students.each do |student|
    puts student
end
puts "The Students of Villains Academy"
puts "--------------"
puts students[0]
puts students[1]
puts students[2]
puts students[3]
puts students[4]
puts students[5]
puts students[6]
puts students[7]
puts students[8]
puts students[9]
puts students[10]
#finally, we print the total number of students
print "Overall we have #{students.count} great students"

