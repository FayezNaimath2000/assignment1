#Fayez Naimath
#CSC415
#Assignment1
#Course class that has information on all the courses
class Course
    def initialize(course_ID, numberSections, min_Seats, max_Seats) #initialize variables
        @cust_course = course_ID
        numberSections = numberSections.to_i
        @cust_sections = numberSections
        min_Seats = min_Seats.to_i
        @minSeats = min_Seats
        max_Seats = max_Seats.to_i
        @maxSeats = max_Seats
    end
    def course()
        @cust_course
    end
    def section()
        @cust_sections
    end
    def array()#create the array that will have the sections with students
        @arr = Array.new(@cust_sections) { Array.new(@maxSeats){"empty"}}       
        
    end
    def array1()
        @arr
    end
    def enroll(student)        #place the student ID of students who will be enrolled into the section
        change = 1 
        for i in (0...@arr.size())
            for j in (0...(@minSeats))
                if (@arr[i][j] == "empty")  #place student if spot if empty
                    @arr[i][j] = student
                    change = 0
                    break
                end
            end
            if change == 0
                break
            end
        end
        out = 0
        if (change == 1) #first have it fill up to minimum number of seats then switch 
            for i in (0...(@arr.size()))    #and fill the rest of the seats til the max
                for j in (@minSeats...(@maxSeats))
                    if (@arr[i][j] == "empty")
                        @arr[i][j] = student
                        out = 1
                        break
                    end
                end
                if out == 1
                    break
                end
            end
        end
    end                 #check whether there is space in the sections 
    def space()
        for i in 0...@arr.size()        
            for j in 0...@arr[i].length()
                if (@arr[i][j] == "empty")
                    return "free"
                end
            end
        end
    end  
    def check()    #prints out courses' information
        for i in 0...(@arr.size())
            for j in 0...(@arr[i].length())
                
                puts "course ID", @cust_course
                puts "student id in spot", @arr[i][j]
                puts "section number", i
                #puts j
            end
        end
    end
=begin
    def printClasses(coursesArray)
        for l in 0..(@arr.size()) 
            sections 
        end
        total = @@number * 
        post = Array.new() { Array.new(6)}
        
        for i in 0..(studentArray.length() -1)
            post[i][0] = coursesArray[i].course()
            post[i][1] = 
            post[i][2] = 
            post[i][3] = 
            post[i][4] = 
            post[i][5] = 
        end
        CSV.open('courses.csv', 'w') do |csv|
            post.each { |ar| csv << ar }
        end
    end
=end
end
