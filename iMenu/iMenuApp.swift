//
//  iMenuApp.swift
//  iMenu
//
//  Created by Rogerio Pires on 31/08/22.
//
import Cocoa
import SwiftUI

@main
struct iMenuApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
      var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
class AppDelegate: NSObject, NSApplicationDelegate {

    var statusBar: StatusBarController?
    var popover = NSPopover.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()
        popover.contentSize = NSSize(width: 150, height: 150)
        popover.contentViewController = NSHostingController(rootView: contentView)
        statusBar = StatusBarController.init(popover)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        NSApplication.shared.terminate(self)
        // Insert code here to tear down your application
    }
}
