//
//  CardListRepository.swift
//  CardsApp
//
//  Created by Kush Sharma on 16/04/2024.
//

import Foundation

final class CardListRepository: CardListRepoable {
    
    func getCards() async throws -> [Card] {
        do {
            return try await NetworkManager.shared.getCards()
        } catch {
            throw error
        }
    }
}

