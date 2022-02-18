class Course
    def initialize(course_ID, numberSections, minSeats, maxSeats)
        @cust_course = course_ID
        numberSections = numberSections.to_i
        @cust_sections = numberSections
        minSeats = minSeats.to_i
        @cust_min = minSeats
        maxSeats = maxSeats.to_i
        @cust_max = maxSeats
    end
    def show()
        @cust_min
    end
end