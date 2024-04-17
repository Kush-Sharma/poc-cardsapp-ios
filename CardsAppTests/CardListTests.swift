//
//  CardListTests.swift
//  CardsAppTests
//
//  Created by Kush Sharma on 16/04/2024.
//

import XCTest

final class CardListTests: XCTestCase {
    
    @MainActor func testSuccessCardListFetch() {
        // Given (Arrange)
        let viewModel = CardListViewModel(cardListRepository: CardListMockRepository())
        
        // When (Act)
        viewModel.getCards()
        
        
        // Then (Assert)
        XCTAssertEqual(viewModel.cards.count, 4)
    }

}
