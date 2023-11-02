//
//  Spotify.swift
//  Menu Shortcuts
//
//  Created by Saketh C on 11/1/23.
//

import Foundation

func runCommand(executableURL: String, arguments: [String]) {
    let process = Process()
    
    process.executableURL = URL(fileURLWithPath: executableURL)
    process.arguments = arguments

    do {
        try process.run()
        process.waitUntilExit()
//      let status = process.terminationStatus
    } catch {
        print("Error \(error)")
    }
}

func killAndRelaunchSpotify() {
    runCommand(executableURL: "/usr/bin/killall", arguments: ["Spotify"])
    runCommand(executableURL: "/usr/bin/open", arguments: ["-a", "/Applications/Spotify.app"])
}
