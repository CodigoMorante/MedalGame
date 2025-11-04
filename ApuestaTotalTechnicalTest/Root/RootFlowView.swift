//
//  RootFlowView.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 31/10/25.
//

import SwiftUI
import SwiftData

struct RootFlowView: View {
    @State private var isReady = false
    @ObservedObject var medalsViewModel: MedalsViewModel
        
    var body: some View {
        ZStack {
            if isReady {
                MainTabView(medalsViewModel: medalsViewModel)
                    .transition(.opacity)
            } else {
                SplashScreenView()
                    .transition(.opacity)
            }
        }
        .animation(.easeOut(duration: 0.5), value: isReady)
        .task {
            await medalsViewModel.loadMedals()
            try? await Task.sleep(nanoseconds: 2_000_000_000)
            withAnimation {
                isReady = true
            }
        }
    }
}
