//
//  CardListCell.swift
//  CardsApp
//
//  Created by Kush Sharma on 6/04/24.
//

import SwiftUI

struct CardListCell: View {
    
    let card: Card
    
    var body: some View {
        HStack {
            Image("creditcardicon")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.blue)
                .aspectRatio(contentMode: .fill)
                .padding(10)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(card.credit_card_number)
                    .font(.title3)
                    .fontDesign(.rounded)
                
                HStack {
                    Text("EXP: \(card.credit_card_expiry_date)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .fontDesign(.rounded)
                    
                    Spacer()
                    
                    Text(card.credit_card_type)
                        .font(.callout)
                        .fontDesign(.rounded)
                }
                
            }
        }
    }
}

struct CardListCell_Previews: PreviewProvider {
    static var previews: some View {
        CardListCell(card: MockData.sampleCard)
    }
}
