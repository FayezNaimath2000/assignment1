#Fayez Naimath
#CSC415
#Assignment1
#Student class that has information on all the students
class Student
    def assignPriority()#calculate priority by having point system for the traits that the student has
        @priority = 0   #higher points, higher prioirty
        if (@cust_year == "Senior")
            @priority += 3  #if student is upperclassmen, have higher points
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
        @priority = @priority - @cust_semester  #if student has more semesters left, lower points
        @priority = @priority + @cust_courses.length() #if student has taken more courses, higher points
                                                    
        if (@cust_firstchoice == "N/A") #less points if student does not have options
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
    end    #initialized variables
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
    def reason(excuse)  #getters and setters
        @exc = excuse
    end
    def reason1()
        @exc
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