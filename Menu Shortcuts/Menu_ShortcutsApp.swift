//
//  Menu_ShortcutsApp.swift
//  Menu Shortcuts
//
//  Created by Saketh C on 11/1/23.
//

import SwiftUI

@main
struct Menu_ShortcutsApp: App {
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
        MenuBarExtra("Menu Bar IP", systemImage: "server.rack") {
            Button("Restart Spotify") {
                killAndRelaunchSpotify()
            }
            
            Button("Copy IP") {
                let ipAddress: String = getIPAddress()
                let pasteboard = NSPasteboard.general
                pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
                pasteboard.setString(ipAddress, forType: .string)
            }
            
            Divider()
            
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
