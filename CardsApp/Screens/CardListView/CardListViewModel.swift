//
//  CardListViewModel.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import SwiftUI
import Observation

@MainActor final class CardListViewModel: ObservableObject {
    
    @Published var cards: [Card] = []
    @Published var alertPopup: AlertPopup?
    @Published var isLoading = false
    
    var cardListRepository: CardListRepoable
    
    init(cardListRepository: CardListRepoable) {
        self.cardListRepository = cardListRepository
    }
    
    func getCards() {
        isLoading = true
        
        Task {
            do {
                self.processCards(cards: try await self.cardListRepository.getCards())
                isLoading = false
            } catch {
                isLoading = false
                guard let cardError = error as? CardError else {
                    self.alertPopup = AlertContext.unableToProcess
                    return
                }
                self.processError(error: cardError)
            }
        }
    }
    
    private func processCards(cards: [Card]) {
        var processedCards: [Card] = []
        for var card in cards {
            // Mask credit card number
            let start = card.credit_card_number.startIndex
            let end =  card.credit_card_number.index(card.credit_card_number.startIndex, offsetBy: 15)
            card.credit_card_number.replaceSubrange(start..<end, with: "**** **** **** ")
            
            // Format Date
            let dateString = card.credit_card_expiry_date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: dateString) {
                dateFormatter.dateFormat = "MM/yy"
                card.credit_card_expiry_date = dateFormatter.string(from: date)
            }
            
            processedCards.append(card)
        }
        
        self.cards = processedCards
    }
    
    private func processError(error: CardError) {
        switch error {
        case .invalidResponse:
            self.alertPopup = AlertContext.invalidResponse
        case .invaidURL:
            self.alertPopup = AlertContext.invalidURL
        case .invalidData:
            self.alertPopup = AlertContext.invalidData
        case .unableToProcess:
            self.alertPopup = AlertContext.unableToProcess
        }
    }
}
