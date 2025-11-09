//
//  MedalGameApp.swift
//  MedalGame
//
//  Created by Christian Morante on 22/10/25.
//

import SwiftUI
import SwiftData

@main
struct MedalGameApp: App {
        
    var body: some Scene {
        WindowGroup {
            RootFlowView()
                .modelContainer(for: MedalLocal.self)
        }
    }
}
