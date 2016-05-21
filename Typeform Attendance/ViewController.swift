//
//  ViewController.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 5/20/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var APIkeyField: NSTextFieldCell!
    @IBOutlet var refreshDate: NSTextField!
    @IBOutlet var UIDkeyField: NSTextField!
    @IBOutlet var numEmailField: NSTextField!
    
    @IBAction func refreshButtonPressed(sender: AnyObject) {
        let todaysDate:NSDate = NSDate()
        let dateFormatter:NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
        let dateValue = dateFormatter.stringFromDate(todaysDate)
        
        refreshDate.stringValue = dateValue
        
    }
    
    @IBAction func apiKeyChanged(sender: NSTextField) {
        Main.newAPI(sender.stringValue)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(sender.stringValue, forKey: "API")
    }
    
    @IBAction func uidKeyChanged(sender: NSTextField) {
        Main.newUID(sender.stringValue)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(sender.stringValue, forKey: "UID")
    }
    
    @IBAction func numEmailChanged(sender: NSTextField) {
        let number = Int(sender.stringValue) ?? 0
        Main.newEmailPerPage(number);
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(number, forKey: "numEmail")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = NSUserDefaults.standardUserDefaults()
   
        let API = defaults.stringForKey("API")
        if API != nil && APIkeyField != nil {
            APIkeyField.stringValue = API ?? ""
            Main.newAPI(APIkeyField.stringValue)
        }
        
        let UID = defaults.stringForKey("UID")
        if UID != nil && UIDkeyField != nil {
            UIDkeyField.stringValue = UID ?? ""
            Main.newUID(UIDkeyField.stringValue)
        }
        
        let numEmail = defaults.integerForKey("numEmail")
        if numEmail != 0 && numEmailField != nil {
            numEmailField.stringValue = String(numEmail)
            let number = Int(numEmailField.stringValue) ?? 0
            Main.newEmailPerPage(number);
        }
        
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

