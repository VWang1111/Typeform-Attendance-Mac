//
//  Person.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 8/11/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Foundation

class Person: Equatable, Hashable, CustomStringConvertible{
    var firstName: String
    var lastName: String
    var email: String
    var meeting: Int
    
    init(firstName: String, lastName: String, email: String, meeting: Int = 0){
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.meeting = meeting;
    }
    
    var hashValue : Int {
        get {
            var hash = 13
            hash = (hash&*7) &+ firstName.hashValue
            hash = (hash&*7) &+ lastName.hashValue
            hash = (hash&*7) &+ email.hashValue
            hash = (hash&*7) &+ meeting.hashValue
            return hash
        }
    }
    
    var description: String{
        return "First Name: \(firstName) Last Name: \(lastName) Attendance: \(meeting)";
    }
}

func ==(lhs: Person, rhs: Person) -> Bool{
    if(lhs.firstName != rhs.firstName){
        return false
    }
    else if(lhs.lastName != rhs.lastName){
        return false
    }
    else if(lhs.email != rhs.email){
        return false
    }
    else if(lhs.meeting != rhs.meeting){
        return false
    }
    return true
}