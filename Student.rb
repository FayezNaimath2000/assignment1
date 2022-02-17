class Student
    
    def assignPriority(year, semester, firstchoice, secondchoice, thirdchoice, numberOfCourses)
        priority = 0
        if year == "senior"
            priority += 3
        end
        if year == "junior"
            priority += 2
        end
        if year == "sophomore"
            priority += 1
        end
        if year == "first year student"
            priority += 0
        end
        priority = priority - semester
        priority = priority + numberofCourses
                                                    #calc for when students make 2nd or 3rd choice unless they took every other course
    end    
    def initialize(student_ID, year, semester, coursesDesired, courses_taken, firstchoice, secondchoice, thirdchoice)
        @cust_ID = student_ID
        @cust_year = year
        @cust_semester = semester
        @cust_desired = coursesDesired
        @cust_taken = coursesTaken                 #make this into an array
        @cust_firstchoice = firstchoice
        @cust_secondchoice = secondchoice
        @cust_thirdchoice = thirdchoice
    end
    def course1(firstcourse)
        @course1 = firstcourse
    end
    def course2(secondcourse)
        @course2 = secondcourse
    end
end