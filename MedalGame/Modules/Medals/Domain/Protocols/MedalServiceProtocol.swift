//
//  MedalServiceProtocol.swift
//  MedalGame
//
//  Created by Christian Morante on 23/10/25.
//

protocol MedalServiceProtocol {
    func fetchMedals() async throws -> [MedalDTO]
}
