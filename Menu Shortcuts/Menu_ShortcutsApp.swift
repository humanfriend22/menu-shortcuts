//
//  Menu_ShortcutsApp.swift
//  Menu Shortcuts
//
//  Created by Saketh C on 11/1/23.
//

import SwiftUI

let sshKnownHostsPath = "/Users/humanfriend22/.ssh/known_hosts"

@main
struct Menu_ShortcutsApp: App {
    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
        MenuBarExtra("Menu Bar IP", systemImage: "server.rack") {
            Button("Reset SSH Known Hosts") {
                runCommand(executableURL: "/bin/rm", arguments: [sshKnownHostsPath])
                runCommand(executableURL: "/usr/bin/touch", arguments: [sshKnownHostsPath])
            }
            
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
