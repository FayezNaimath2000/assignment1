#Fayez Naimath
#CSC415
#Assignment1
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
    def array()
        @arr = Array.new(@cust_sections) { Array.new(@maxSeats){"emp"}}       #create the array that will have the sections with students
        #for i in (0...(@arr.size() - 1))
         #   @arr[i][0] = (i + 1) 
        #end
    end
    def array1()
        @arr
    end
    def enroll(student)                         #place the student ID of students who will be enrolled into the section
        change = 1 
        for i in (0...(@arr.size()-1))
            for j in (0...(@minSeats - 1))
                if (@arr[i][j] == "emp")
                    @arr[i][j] = student
                    change = 0
                end
            end
        end
        if (change == 1)                        #first have it fill up to minimum number of seats then switch and fill the rest of the seats til the max
            for i in (0...(@arr.size() - 1))
                for j in (@minSeats...(@maxSeats -1))
                    if (@arr[i][j] == "emp")
                        @arr[i][j] = student
                    end
                end
            end
        end
    end                 #check whether there is space in the sections 
    def space()
        for i in (0...(@arr.size - 1))        
            for j in (0...(@arr[i].length-1))
                if (@arr[i][j] == "emp")
                    return "free"
                end
            end
        end
    end  
end