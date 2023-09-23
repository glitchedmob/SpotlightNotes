//
//  AppDelegate.swift
//  SpotlightNotes
//
//  Created by Levi Zitting on 9/16/23.
//

import Cocoa
import KeyboardShortcuts

class AppDelegate: NSObject, NSApplicationDelegate {
    private var notesWindow: NotesWindow!

    private var isVisible = false

    private var statusItem: NSStatusItem!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        notesWindow = NotesWindow()

        statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.variableLength)

        if let button = statusItem.button, #available(macOS 11.0, *) {
            button.image = NSImage(systemSymbolName: "1.circle", accessibilityDescription: "1")
        }

        setupMenus()

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
            notesWindow.orderOut(self)
        } else {
            notesWindow.makeKey()
            notesWindow.orderFrontRegardless()
            NSApp.activate(ignoringOtherApps: true)
        }

        isVisible = !isVisible
    }

    private func setupMenus() {
        let menu = NSMenu()

        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))

        statusItem.menu = menu
    }

    @objc func didTapQuit() {

    }
}

extension KeyboardShortcuts.Name {
    static let showFloatingPanel = Self("showFloatingPanel", default: .init(.space, modifiers: [.option]))
}
