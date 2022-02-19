require 'csv'
require './Student'
require './Course'

def assignClasses(studentArray, coursesArray)
    n = studentArray.length() - 1 
    m = coursesArray.length() - 1
    for y in 0..m
        coursesArray[y].array() #create the arrays for each course
    end
    for x in 0..n
        for y in 0..m
            if studentArray[x].firstchoice() == coursesArray[y].course()
                if (coursesArray[y].space() == "free") && (studentArray[x].course_1().nil?)    #enroll the students into the courses provided that they meet all of the requirements
                    coursesArray[y].enroll()
                    studentArray[x].course1(coursesArray[y].course())
                elsif (coursesArray[y].space() == "free") && (studentArray[x].course_2().nil?)
                    coursesArray[y].enroll()
                    studentArray[x].course2(coursesArray[y].course())
                end
            elsif studentArray[x].secondchoice() == coursesArray[y].course()
                if (coursesArray[y].space() == "free") && (studentArray[x].course_1().nil?)
                    coursesArray[y].enroll()
                    studentArray[x].course1(coursesArray[y].course())
                elsif (coursesArray[y].space() == "free") && (studentArray[x].course_2().nil?)
                    coursesArray[y].enroll()
                    studentArray[x].course2(coursesArray[y].course())
                end
            elsif studentArray[x].thirdchoice() == coursesArray[y].course()
                if (coursesArray[y].space() == "free") && (studentArray[x].course_1().nil?)
                    coursesArray[y].enroll()
                    studentArray[x].course1(coursesArray[y].course())
                elsif (coursesArray[y].space() == "free") && (studentArray[x].course_2().nil?)
                    coursesArray[y].enroll()
                    studentArray[x].course2(coursesArray[y].course())
                end
            end 
        end
    end
end    

def sortPriority(studentArray)
    n = studentArray.length() - 1 
    for x in 0..n
        studentArray[x].assignPriority()    #call the function to assign priority for each student
    end
    for b in 0..n
        for c in 0..b
            if (studentArray[b].priority() > studentArray[c].priority())    #sort the students based on their priority score
                temp = studentArray[c]
                studentArray[c] = studentArray[b]
                studentArray[b] = temp
            end
        end
    end
end

#get in the input data for students
studentInput = []
File.open("student_pref.csv").each_line { |csvrecord|       
    studentInput << csvrecord.chomp.split(",")
}
studentArray = []
studentInput.shift()
studentInput.each do |sub|          
    a = sub.length()
    studentArray << Student.new(sub[0], sub[1], sub[a-5], sub[a-4], sub[a-3], sub[a-2], sub[a-1])   #store student input data into array of student objects
end
x = 0 
studentInput.each do |sub|           
    array = []
    len = sub.length() 
    for a in 2..(len-5)
        if (sub[a] == sub[len-6])       
            word1 = sub[a]
            length = word1.length()
            sub[a] = word1[1..(length - 2)]         #make sure each of the courses in the "courses already taken" is put into an array seperately and take out the quotation marks and spaces
            array << sub[a]                                   
            break
        else
            word = sub[a]
            length = word.length()
            sub[a] = word[1..(length - 1)]
            array << sub[a]    
        end
    end
    studentArray[x].coursesTaken(array)             #put array containing all courses student has taken into class instance
    x = x + 1
end   

coursesInput = []
File.open("course_constraints.csv").each_line { |csvrecord|     
    coursesInput << csvrecord.chomp.split(",")      #get in the input data for courses
}
coursesArray = []
coursesInput.shift()
coursesInput.each do |sub|
    coursesArray << Course.new(sub[0], sub[1], sub[2], sub[3]) #get in the input data of the courses into an array of Course class instances 
end

sortPriority(studentArray)          #sort the students by priority
assignClasses(studentArray, coursesArray)   #assign students to courses


