//
//  NotesWindow.swift
//  SpotlightNotes
//
//  Created by Levi Zitting on 9/22/23.
//

import Foundation
import Cocoa

class NotesWindow: NSWindow {
    override var canBecomeKey: Bool { true }

    init() {
        super.init(contentRect: NSRect(x: 0, y: 0, width: 480, height: 270), styleMask: [], backing: .buffered, defer: false)
        center()
        level = .floating
    }
}
