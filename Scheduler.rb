require 'csv'
require './Student'
require './Course'
#Schedules all of the students into the classes

def printStudents(studentArray) #prints out all the student information
    post = Array.new(studentArray.length()) { Array.new(4)} #creates array that keeps important 
    for i in 0..(studentArray.length() -1)                  #student information
        post[i][0] = studentArray[i].id()
        post[i][1] = studentArray[i].course_1()
        post[i][2] = studentArray[i].course_2()
        post[i][3] = studentArray[i].reason1()
    end
    CSV.open('students.csv', 'w') do |csv|  #puts all info from array into csv file
        post.each { |ar| csv << ar }
    end
end

def place(studentArray, coursesArray, x, y) #method to place student into course
    if (coursesArray[y].space() == "free") && (studentArray[x].course_1().nil?)    
        coursesArray[y].enroll(studentArray[x].id())#enroll the students into the courses provided that they meet all of the requirements
        studentArray[x].course1(coursesArray[y].course())#provided that they meet all of the requirements
    elsif (coursesArray[y].space() == "free") && (studentArray[x].course_2().nil?)
        coursesArray[y].enroll(studentArray[x].id())
        studentArray[x].course2(coursesArray[y].course())
    end
end

def createArray(coursesArray, m)
    for z in 0..m
        coursesArray[z].array() #create the arrays for each course
    end
end

def assignClasses(studentArray, coursesArray)   #method to assign students to classes
    n = studentArray.length() - 1 
    m = coursesArray.length() - 1
    createArray(coursesArray, m)
    for x in 0..n
        for y in 0..m   #make sure courses have sections and student wants courses
            if (studentArray[x].numberOfCourses() > 0) && (coursesArray[y].section() > 0)
                if studentArray[x].firstchoice() == coursesArray[y].course()#go through all options
                    place(studentArray, coursesArray, x, y) #place into courses
                elsif studentArray[x].secondchoice() == coursesArray[y].course()
                    place(studentArray, coursesArray, x, y)
                elsif studentArray[x].thirdchoice() == coursesArray[y].course()
                    place(studentArray, coursesArray, x, y)
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
            if (studentArray[b].priority() > studentArray[c].priority())    
                temp = studentArray[c]#sort the students based on their priority score
                studentArray[c] = studentArray[b]   #swap function in bubble sort
                studentArray[b] = temp
            end
        end
    end
end

#get in the input data for students
studentInput = []
File.open("student_pref.csv").each_line { |csvrecord|       
    studentInput << csvrecord.chomp.split(",")  #take in input from csv file
}
studentArray = []
studentInput.shift()
studentInput.each do |sub|          
    a = sub.length()    #adjust the input, place into array and then place into student array
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
            sub[a] = word1[1..(length - 2)]        
            array << sub[a]                                   
            break #make sure each of the courses in the "courses already taken" is put into 
        else    #an array seperately and take out the quotation marks and spaces
            word = sub[a]
            length = word.length()
            sub[a] = word[1..(length - 1)]
            array << sub[a]    
        end
    end
    studentArray[x].coursesTaken(array) #put array containing all courses student has taken into class instance
    x = x + 1
end   

coursesInput = []
File.open("course_constraints.csv").each_line { |csvrecord|     
    coursesInput << csvrecord.chomp.split(",")      #get in the input data for courses
}
coursesArray = []
coursesInput.shift()
coursesInput.each do |sub|#get in the input data of the courses into an array of Course class instances 
    coursesArray << Course.new(sub[0], sub[1], sub[2], sub[3]) 
end

for i in 0..(studentArray.length() - 1)
    if studentArray[i].numberOfCourses() == 1 #write "none" for the chosen course 
        studentArray[i].course2("None") #if student wants less classes
    end
    if studentArray[i].numberOfCourses() == 0
        studentArray[i].course2("None")
        studentArray[i].course1("None")
        studentArray[i].reason("does not want any classes")  #give reason for student having no classes
    end
end    
sortPriority(studentArray)          #sort the students by priority
assignClasses(studentArray, coursesArray)   #assign students to courses

for i in 0..(coursesArray.length() - 1)
    coursesArray[i].check()     #print out all courses' info
end
for i in 0..(studentArray.length() - 1)
    if (studentArray[i].course_1().nil?) && (studentArray[i].course_2().nil?) && (studentArray[i].numberOfCourses() > 0) 
        studentArray[i].reason("there was no space")    #give reason for why student wasn't able to be placed
    end
end
printStudents(studentArray)
=begin
for f in 0..(coursesArray.length() - 1)
    coursesArray[i].printClasses()
end
=end
