require 'csv'
#require student.rb
#require course.rb

class Course
    def initialize(course_ID, numberSections, minSeats, maxSeats)
        @cust_course = course_ID
        @cust_sections = numberSections
        @cust_min = minSeats
        @cust_max = maxSeats
    end
    def printCount()
        puts "dsfs #@cust_sections"
    end    
end

student = Array.new;
#CSV.foreach(("course_constraints.csv"), headers: true, col_sep: ",") do |row|    
#end

CSV.foreach("course_constaints.csv", { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all}) do |row|
    student << row.to_hash
end

puts student
#class1 = Course.new(342, "sdfs", 324, 4535)
#class1.printCount()

#table = CSV.parse(File.read("courses.csv"), headers: false)
#table2 = CSV.parse(File.read("students.csv"), headers: false)

#table.by_col[1] = 