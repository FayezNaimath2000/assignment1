#Fayez Naimath
#CSC415
#Assignment1
class Course
    def initialize(course_ID, numberSections, minSeats_, maxSeats_) #initialize variables
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
        @array = Array.new(@cust_sections) { Array.new(@maxSeats){0}}       #create the array that will have the sections with students
        for i in (0...(@array.size() - 1))
            #for j in (0...(@array[].size() - 1))
            @array[i][0] = (i + 1) 
        end
        for i in (0...(@array.size() - 1))
            for j in (0...(@array.length() - 1))    
            puts @array[i][j] 
            end
        end
    end
    def array1()
        @array
    end
    def enroll(student)
        change = 1 
        for i in (0...(@array.size - 1))
            for j in (0...(@minSeats -1))
                if (@array[i][j] == "emp")
                    @array[i][j] = student
                    change = 0
                end
            end
        end
        if (change == 1)
            for i in (0...(@array.size - 1))
                for j in (@minSeats...(@maxSeats -1))
                    if (@array[i][j] == "emp")
                        @array[i][j] = student
                    end
                end
            end
        end
        puts @array
    end
    def space()
        for i in (0...(@array.size - 1))        #check where there is 
            for j in (0...@array[i].length)
                if (@array[i][j] == "emp")
                    return "free"
                end
            end
        end
    end  
end