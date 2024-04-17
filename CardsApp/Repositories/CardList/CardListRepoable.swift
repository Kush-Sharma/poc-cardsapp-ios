//
//  CardListRepoable.swift
//  CardsApp
//
//  Created by Kush Sharma on 16/04/2024.
//

import Foundation

protocol CardListRepoable {
    func getCards() async throws -> [Card]
}
