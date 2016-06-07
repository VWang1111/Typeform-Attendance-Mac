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
        let rootURL = NSURL(fileURLWithPath: URL)
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: rootURL)
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
        
        
        print(rootObject.questions?.count)
        
    }
    
}