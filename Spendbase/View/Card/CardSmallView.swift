//
//  CardSmallView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct CardSmallView: View {
    var card: Card
    var body: some View {
        HStack {
            ZStack {
                Color.neutral800
                    .cornerRadius(4)
                PartnerCircleView(imageName: Partner(for: card.serviceName))
                .frame(width: 30, height: 30)
                .offset(x: -20, y: -12)
                Text(card.cardNumber)
                    .font(.system(size: 10))
                    .fontWeight(.semibold)
                    .offset(x: 5, y: 5)
            }
            .foregroundColor(Color.neutral50)
            .frame(width: 48, height: 32)
            Text(card.serviceName)
                .font(.system(size: 18))
                .fontWeight(.medium)
        }
    }
}

struct CardSmallView_Previews: PreviewProvider {
    static var previews: some View {
        CardSmallView(card: MockData.mockRequest1.first!)
    }
}
