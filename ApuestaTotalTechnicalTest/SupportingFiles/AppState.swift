//
//  AppState.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 4/11/25.
//

import Combine

class AppState: ObservableObject {
    @Published var isReady = false

    func start() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run { isReady = true }
    }
}
