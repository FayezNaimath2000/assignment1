class Student
    
    def assignPriority(numberOfCourses)
        @priority = 0
        if @cust_year == "Senior"
            @priority += 3
        end
        if @cust_year == "Junior"
            @priority += 2
        end
        if @cust_year == "Sophomore"
            @priority += 1
        end
        if @cust_year == "First year student"
            @priority += 0
        end
        @priority = @priority - @cust_semester
        @priority = @priority + numberofCourses   #incorporate the number of courses somehow
                                                    #calc for when students make 2nd or 3rd choice unless they took every other course
    end    
    def initialize(student_ID, year, semester, coursesDesired, firstchoice, secondchoice, thirdchoice)
        @cust_ID = student_ID
        @cust_year = year                   #convert to integers
        semester = semester.to_i
        @cust_semester = semester
        coursesDesired = coursesDesired.to_i
        @cust_desired = coursesDesired
                        #make this into an array
        @cust_firstchoice = firstchoice
        @cust_secondchoice = secondchoice
        @cust_thirdchoice = thirdchoice
    end
    
    def coursesTaken(courses)   #array
        @cust_courses = courses
    end
    def show()
        @cust_desired
    end
    def course1(firstcourse)
        @course1 = firstcourse
    end
    def course2(secondcourse)
        @course2 = secondcourse
    end
end