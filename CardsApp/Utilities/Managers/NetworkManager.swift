//
//  NetworkManager.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://random-data-api.com/api/v2/"
    //Endpoint
    private let cardsURL = baseURL + "credit_cards?size=100"
    
    private init() {}

    func getCards() async throws -> [Card] {
        guard let url =  URL(string: cardsURL) else {
            throw CardError.invaidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw CardError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Card].self, from: data)
        } catch {
            throw CardError.invalidData
        }
    }
}
