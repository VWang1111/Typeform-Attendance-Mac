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
    
    static func retreiveResponses(){
        let URL = "https://api.typeform.com/v1/form/" + UIDkey + "?key=" + APIkey + "&completed=true"
        let rootURL = NSURL(string: URL)
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: rootURL!)
        let session = NSURLSession.sharedSession()
        
        let task = session.downloadTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as? NSHTTPURLResponse
            
            if(httpResponse != nil){
                
                let statusCode = httpResponse!.statusCode
                
                if (statusCode == 200) {
                    print("Everyone is fine, file downloaded successfully.")
                }
                
                if (statusCode == 200) {
                    do{
                        let rootDict = try NSJSONSerialization.JSONObjectWithData(NSData(contentsOfURL: data!)!, options:.AllowFragments)
                        
                        //Instantiate object from dictionary
                        rootObject = Json4Swift_Base(dictionary: rootDict as! NSDictionary)
                        
                        //print("Number of responses:" + rootObject.responses?.count)
                    }catch {
                        print("Error with Json: \(error)")
                    }
                    
                }
            }
            else{
                print("error downloading json")
            }
        }
        
        task.resume()
        
    }
    
    static func getAverageAttendance() -> Int{
        var personList = [Person]()
        
        if(rootObject.responses == nil){
            return 0
        }
        
        for Responses in rootObject.responses!{
            let firstName = Responses.answers?.textfield_21284714 ?? ""
            let lastName = Responses.answers?.textfield_21284762 ?? ""
            let email = Responses.answers?.email_21284788 ?? ""
            let person = Person(firstName: firstName, lastName: lastName, email: email)
            
            personList.append(person)
        }
        
        var dict = [Person: Int]()
        
        for person in personList{
            let temp = Person(firstName: person.firstName, lastName: person.lastName, email: "")
            if(dict.indexForKey(temp) != nil){
                dict[temp] = dict[temp]! + 1;
            }
            else{
                dict[temp] = 1;
            }
        }
        
        var totalAttendance = 0
        var maxValue = 0
        for attendance in dict.values{
            if(attendance > maxValue){
                maxValue = attendance
            }
            totalAttendance += attendance
        }
        
        if(maxValue == 0){
            return 0
        }
        
        return totalAttendance/maxValue
    }
    
    static func getAttendance() -> [Person]{
        var personList = [Person]()
        
        if(rootObject.responses == nil){
            return personList
        }
        
        for Responses in rootObject.responses!{
            let firstName = Responses.answers?.textfield_21284714 ?? ""
            let lastName = Responses.answers?.textfield_21284762 ?? ""
            let email = Responses.answers?.email_21284788 ?? ""
            let person = Person(firstName: firstName, lastName: lastName, email: email)
            
            personList.append(person)
        }
        
        var dict = [Person: Int]()
        
        for person in personList{
            let temp = Person(firstName: person.firstName, lastName: person.lastName, email: "")
            if(dict.indexForKey(temp) != nil){
                dict[temp] = dict[temp]! + 1;
            }
            else{
                dict[temp] = 1;
            }
        }
        
        personList = [Person]()
        
        for Responses in rootObject.responses!{
            let firstName = Responses.answers?.textfield_21284714 ?? ""
            let lastName = Responses.answers?.textfield_21284762 ?? ""
            let email = Responses.answers?.email_21284788 ?? ""
            
            let temp = Person(firstName: firstName, lastName: lastName, email: "")
            let person = Person(firstName: firstName, lastName: lastName, email: email, meeting: dict[temp]!)
            
            if(personList.contains(temp) && !personList.contains(person)){
                personList.append(person)
                personList.removeAtIndex(personList.indexOf(temp)!)
            }
            
            if(!personList.contains(person)){
                personList.append(person)
            }
        }
        
        return personList
    }
    
}