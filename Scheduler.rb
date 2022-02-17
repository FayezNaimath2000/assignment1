require 'csv'
require './Student'
require './Course'

students = Array.new;
classes = Array.new;
#CSV.foreach("course_constraints.csv", { encoding: "UTF-8", headers: true, converters: :all}) do |row|
#    students << row.to_hash
#end
csvarray = []
File.open("student_pref.csv", "r").each_line { |csvrecord|
    csvarray << csvrecord.chomp.split(",")
}
puts csvarray[6][2]

#students.each_with_index {Student.new(:Student_ID, :College_Year, :List_of_courses_taken, :Semesters_left_to_graduate, :Number_of_courses_desired, :First_Choice_Course, :Second_Choice_Course, :Third_Choice_Course)}
#students.each_with_index {Course.new(:course_Number, :number_of_sections, :minimum_number_of_seats, :maximum_number_of_seats)}

#class1 = Course.new("234", 34, 34, 23)
#class1.printCount()