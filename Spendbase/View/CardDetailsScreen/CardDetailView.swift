//
//  CardDetailView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct CardDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var card: Card
    var body: some View {
        ZStack {
            Color.neutral50
                .ignoresSafeArea(.container, edges: .top)
            VStack {
                CardView()
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                TranactionCardListView(history: card.history)
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.neutral800)
                    }
                }
            }
            ToolbarItem(placement: .principal) {
                HStack(spacing: 16) {
                    PartnerCircleView(imageName: Partner(for: card.serviceName))
                        .frame(width: 40, height: 40)
                    Text(card.serviceName)
                        .font(.system(size: 16))
                        .foregroundColor(Color.neutral800)
                    Text("•• \(card.cardNumber)")
                        .font(.system(size: 12))
                        .foregroundColor(Color.neutral500)
                    
                }
                .foregroundColor(Color.neutral50)
                .fontWeight(.medium)
                .frame(height: 48)
            }
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailView(card: MockData.mockRequest1.first!)
    }
}
