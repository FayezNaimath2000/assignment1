class student
    def assignPriority(year, semester, 1stchoice, 2ndchoice, 3rdchoice, numberOfCourses)
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
    def initialize(student_ID, year, semester, coursesDesired, cust_taken, 1stchoice, 2ndchoice, 3rdchoice)
        @cust_ID = student_ID
        @cust_year = year
        @cust_semester = semester
        @cust_desired = coursesDesired
      #  @cust_taken = coursesTaken                 #make this into an array
        @cust_1stchoice = 1stchoice
        @cust_2ndchoice = 2ndchoice
        @cust_3rdchoice = 3rdchoice
    end
    def course1(1stcourse)
        @course1 = 1stcourse
    end
    def course2(2nd course)
        @course2 = 2nd course
    end
end