//
//  MapKitAppApp.swift
//  MapKitApp
//
//  Created by FAMM on 25/09/23.
//

import SwiftUI

@main
struct MapKitAppApp: App {
    
    @StateObject var manager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
        }
    }
}
