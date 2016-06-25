//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var arr:[Int] = [0,2,4,1,3]
arr.sort()

//enum Mentor {
//    case HemHem
//    case Inocchi
//    case Sakincho
//}
//
//var mentorArr: [Mentor] = [.Inocchi, .HemHem, .Sakincho]
//mentorArr.sort()

protocol DidRenameCourseDelegate {
    func didRenameCourse(newName: String)
}

struct Course {
    var name: String
    var delegete: DidRenameCourseDelegate?
    
    init (name: String) {
        self.name = name
    }
    
    mutating func rename(newName: String) {
        self.name = newName
        delegete?.didRenameCourse(newName)
    }
    
}

class Mentor: DidRenameCourseDelegate {
    var name: String
    var course: Course
    
    init (name: String, course: Course) {
        self.name = name
        self.course = course
    }
    
    func didRenameCourse(newName: String) {
        self.course.name = newName
        print("CourseからMentorにdelegate")
    }
    
}

var webS = Course(name: "Webプログラミング")
var upyon = Mentor(name: "Uyama", course: webS)
webS.delegete = upyon

webS.rename("Webサービス")
upyon.course.name
