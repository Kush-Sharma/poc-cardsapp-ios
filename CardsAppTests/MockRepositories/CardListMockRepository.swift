//
//  CardListMockRepository.swift
//  CardsAppTests
//
//  Created by Kush Sharma on 16/04/2024.
//

import Foundation

final class CardListMockRepository: CardListRepoable {
    
    func getCards() async throws -> [Card] {
        return MockData.cards
    }
}
