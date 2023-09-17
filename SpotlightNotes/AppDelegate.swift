//
//  AppDelegate.swift
//  SpotlightNotes
//
//  Created by Levi Zitting on 9/16/23.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)

        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 270), styleMask: [], backing: .buffered, defer: false)
        window.center()
        window.makeKeyAndOrderFront(nil)
        window.level = .floating
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}
