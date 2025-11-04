//
//  RootFlowView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 31/10/25.
//

import SwiftUI
import SwiftData

struct RootFlowView: View {
    @StateObject var appState = AppState()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        let medalsViewModel = MedalsModuleBuilder.buildViewModel(context: context)
        ZStack {
            if appState.isReady {
                MainTabView(medalsViewModel: medalsViewModel)
                    .transition(.opacity)
            } else {
                SplashScreenView()
                    .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: 0.5), value: appState.isReady)
        .task {
            await medalsViewModel.loadMedals()
            await appState.start()
        }
    }
}
