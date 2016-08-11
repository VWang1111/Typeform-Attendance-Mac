//
//  AppDelegate.swift
//  Typeform Attendance
//
//  Created by Victor Wang on 5/20/16.
//  Copyright © 2016 Victor Wang. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        NSApplication.sharedApplication().windows[0].styleMask = NSClosableWindowMask | NSTitledWindowMask | NSMiniaturizableWindowMask
        
        let frame = NSApplication.sharedApplication().windows[0]
        frame.setContentSize(NSSize(width: 450, height: 328))
        frame.title = "Typeform Attendance App"
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }


}

