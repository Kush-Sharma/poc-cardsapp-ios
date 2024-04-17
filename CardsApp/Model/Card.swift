//
//  Card.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import Foundation

struct Card: Decodable, Identifiable {
    let id: Int
    let uid: UUID
    var credit_card_number: String
    var credit_card_expiry_date: String
    let credit_card_type: String
}

struct MockData {
    static let sampleCard = Card(id: 9843,
                                 uid: UUID(),
                                 credit_card_number: "1211-1221-1234-2201",
                                 credit_card_expiry_date: "2028-04-06",
                                 credit_card_type: "mastercard")
    
    static let cards = [sampleCard, sampleCard, sampleCard, sampleCard]
}
