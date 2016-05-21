//
//  Main.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 5/20/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Foundation

class Main{
    static var APIkey = ""
    static var UIDkey = ""
    static var numEmailPerPage = 50
    static var rootObject: Json4Swift_Base! = Json4Swift_Base(dictionary: NSDictionary())
    
    static func newAPI(API: String){
        APIkey = API
    }
    
    static func newUID(UID: String){
        UIDkey = UID
    }
    
    static func newEmailPerPage(email: Int){
        numEmailPerPage = email
    }
    
}