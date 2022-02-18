require 'csv'
require './Student'
require './Course'

def sortPriority(studentArray)
    n = studentArray.length() - 1 
    for x in 0..n
        studentArray[x].assignPriority()
    end
    for b in 0..n
        for c in 0..b
            if (studentArray[b].priority() > studentArray[c].priority())
                temp = studentArray[c]
                studentArray[c] = studentArray[b]
                studentArray[b] = temp
            end
        end
    end
    for a in 0..n 
        puts studentArray[a].priority()
    end
end

studentInput = []
File.open("student_pref.csv").each_line { |csvrecord|       #make the file name user input
    studentInput << csvrecord.chomp.split(",")
}
studentArray = []
studentInput.shift()
studentInput.each do |sub|
    a = sub.length()
    studentArray << Student.new(sub[0], sub[1], sub[a-5], sub[a-4], sub[a-3], sub[a-2], sub[a-1])
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
            break
        else
            word = sub[a]
            length = word.length()
            sub[a] = word[1..(length - 1)]
            array << sub[a]    
        end
    end
    studentArray[x].coursesTaken(array)
    x = x + 1
end   

coursesInput = []
File.open("course_constraints.csv").each_line { |csvrecord|     #make the file name user input
    coursesInput << csvrecord.chomp.split(",")
}
coursesArray = []
coursesInput.shift()
coursesInput.each do |sub|
    coursesArray << Course.new(sub[0], sub[1], sub[2], sub[3])
end

sortPriority(studentArray)

