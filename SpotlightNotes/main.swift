//
//  main.swift
//  SpotlightNotes
//
//  Created by Levi Zitting on 9/16/23.
//

import Cocoa

let app = NSApplication.shared
let delegate = AppDelegate()
app.delegate = delegate

_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
