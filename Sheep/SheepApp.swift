//
//  SheepApp.swift
//  Sheep
//
//  Created by Rostislav Brož on 1/11/22.
//

import SwiftUI

@main
struct SheepApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
