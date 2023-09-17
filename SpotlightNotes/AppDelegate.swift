//
//  AppDelegate.swift
//  SpotlightNotes
//
//  Created by Levi Zitting on 9/16/23.
//

import Cocoa
import KeyboardShortcuts

class AppDelegate: NSObject, NSApplicationDelegate {
    private var window: NSWindow!

    private var isVisible = false

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.setActivationPolicy(.accessory)

        window = NSWindow(contentRect: NSRect(x: 0, y: 0, width: 480, height: 270), styleMask: [], backing: .buffered, defer: false)
        window.center()
        window.level = .floating

        KeyboardShortcuts.onKeyUp(for: .showFloatingPanel) { [weak self] in
            self?.toggleWindow()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }


    private func toggleWindow() {
        if (isVisible) {
            window.orderOut(self)
        } else {
            window.makeKeyAndOrderFront(self)
            NSApp.activate(ignoringOtherApps: true)
        }

        isVisible = !isVisible
    }
}

extension KeyboardShortcuts.Name {
    static let showFloatingPanel = Self("showFloatingPanel", default: .init(.space, modifiers: [.option]))
}
