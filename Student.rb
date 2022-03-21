#Fayez Naimath
#CSC415
#Assignment1
class Student
    def assignPriority()
        @priority = 0
        if (@cust_year == "Senior")
            @priority += 3
        end
        if (@cust_year == "Junior")
            @priority += 2
        end
        if (@cust_year == "Sophomore")
            @priority += 1
        end
        if (@cust_year == "First year student")
            @priority += 0
        end
        @priority = @priority - @cust_semester
        @priority = @priority + @cust_courses.length()   #calculate priority by having point system for the traits that the student has
                                                    
        if (@cust_firstchoice == "N/A")
            @priority = @priority - 1
        end
        if (@cust_secondchoice == "N/A")
            @priority = @priority - 1
        end
        if (@cust_thirdchoice == "N/A")
            @priority = @priority - 1
        end
    end
    def priority()
        @priority
    end    
    def initialize(student_ID, year, semester, coursesDesired, firstchoice, secondchoice, thirdchoice)  #initialize variables
        @cust_ID = student_ID
        @cust_year = year                   
        semester = semester.to_i
        @cust_semester = semester
        coursesDesired = coursesDesired.to_i
        @cust_desired = coursesDesired
        @cust_firstchoice = firstchoice
        @cust_secondchoice = secondchoice
        @cust_thirdchoice = thirdchoice
    end
    def id()
        @cust_ID
    end
    def numberOfCourses()
        @cust_desired
    end
    def coursesTaken(courses)   
        @cust_courses = courses
    end
    def firstchoice()
        @cust_firstchoice
    end
    def secondchoice()
        @cust_secondchoice
    end
    def thirdchoice()
        @cust_thirdchoice
    end
    def course1(firstcourse)
        @course1 = firstcourse
    end
    def course_1()
        @course1
    end
    def course2(secondcourse)
        @course2 = secondcourse
    end
    def course_2()
        @course2
    end
end