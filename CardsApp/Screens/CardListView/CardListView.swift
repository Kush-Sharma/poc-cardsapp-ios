//
//  CardListView.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import SwiftUI

struct CardListView: View {
    
    @StateObject var viewModel = CardListViewModel(cardListRepository: CardListRepository())
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.cards) { card in
                    CardListCell(card: card)
                }
                .listStyle(.plain)
                .navigationTitle("💳 Cards")
            }
            .task {
                viewModel.getCards()
            }
            
            if viewModel.isLoading {
                LoaderView()
            }
        }
        .alert(item: $viewModel.alertPopup) { alertPopup in
            Alert(title: alertPopup.title,
                  message: alertPopup.message,
                  dismissButton: alertPopup.dismissButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
