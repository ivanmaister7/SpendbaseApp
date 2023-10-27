//
//  TransactionSmallView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct TransactionSmallView: View {
    var transaction: Transaction
    
    var body: some View {
        HStack{
            PartnerCircleView(imageName: Partner(for: transaction.sum > 0 ?
                                                 "income" : transaction.serviceName))
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                Text(transaction.serviceName)
                    .font(.system(size: 16))
                    .foregroundColor(Color.neutral800)
                Text("•• \(transaction.cardNumber)")
                    .font(.system(size: 12))
                    .foregroundColor(Color.neutral500)
            }
            .fontWeight(.medium)
            .padding(.leading, 8)
        }
        .foregroundColor(Color.neutral50)
        .frame(height: 48)
    }
}

struct TransactionSmallView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSmallView(transaction: MockData.mockRequest2.first!)
    }
}
