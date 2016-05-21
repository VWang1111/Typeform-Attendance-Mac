//
//  ViewController.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 5/20/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var refreshDate: NSTextField!
    
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
    }
    
    @IBAction func uidKeyChanged(sender: NSTextField) {
        Main.newUID(sender.stringValue)
    }
    
    @IBAction func numEmailChanged(sender: NSTextField) {
        let number = Int(sender.stringValue) ?? 0
        Main.newEmailPerPage(number);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

