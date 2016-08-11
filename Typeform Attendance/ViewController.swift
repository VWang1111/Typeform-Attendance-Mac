//
//  ViewController.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 5/20/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var attendanceTableView: NSTableView!
    @IBOutlet var APIkeyField: NSTextField!
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
        
        Main.retreiveResponses()
        
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
    
    override func viewDidAppear() {
        if(attendanceTableView != nil){
            attendanceTableView.reloadData()
        }
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
        else if API != nil{
            Main.newAPI(API!)
        }
        
        let UID = defaults.stringForKey("UID")
        if UID != nil && UIDkeyField != nil {
            UIDkeyField.stringValue = UID ?? ""
            Main.newUID(UIDkeyField.stringValue)
        }
        else if UID != nil{
            Main.newUID(UID!)
        }
        
        let numEmail = defaults.integerForKey("numEmail")
        if numEmail != 0 && numEmailField != nil {
            numEmailField.stringValue = String(numEmail)
            let number = Int(numEmailField.stringValue) ?? 0
            Main.newEmailPerPage(number);
        }
        else if numEmail != 0{
            let number = Int(numEmail) ?? 0
            Main.newEmailPerPage(number);
        }
        
        if(attendanceTableView != nil){
            attendanceTableView.setDelegate(self);
            attendanceTableView.setDataSource(self);
        }
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController : NSTableViewDataSource {
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        if(tableView == attendanceTableView){
            return Main.getAttendance().count
        }
        
        return 0;
    }
}

extension ViewController : NSTableViewDelegate {
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let personList = Main.getAttendance()

        var text:String = ""
        var cellIdentifier: String = ""
        
        guard row < personList.count else {
            return nil
        }
        
        let item = personList[row]

        if tableColumn == tableView.tableColumns[0] {
            text = item.firstName
            cellIdentifier = "FirstNameID"
        } else if tableColumn == tableView.tableColumns[1] {
            text = item.lastName
            cellIdentifier = "LastNameID"
        } else if tableColumn == tableView.tableColumns[2] {
            text = String(item.meeting)
            cellIdentifier = "MeetingsAttendedID"
        } else if tableColumn == tableView.tableColumns[3] {
            text = item.email
            cellIdentifier = "EmailID"
        }
        
        if let cell = tableView.makeViewWithIdentifier(cellIdentifier, owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        
        return nil
    }
}

