//
//  TransactionCardSmallView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct TransactionCardSmallView: View {
    var transaction: TransactionDay
    
    var body: some View {
        HStack{
            ZStack {
                PartnerCircleView(imageName: Partner(for: transaction.serviceName))
                    .frame(width: 40, height: 40)
                if transaction.isDeclined {
                    Circle()
                        .fill(.red)
                        .offset(x: 15, y: 15)
                        .frame(width: 12, height: 12)
                }
            }
            VStack(alignment: .leading) {
                Text(transaction.serviceName)
                    .font(.system(size: 16))
                    .foregroundColor(Color.neutral800)
                if transaction.isDeclined {
                    Text("Declined")
                        .font(.system(size: 12))
                        .foregroundColor(Color.red)
                }
            }
            .padding(.leading, 8)
        }
        .fontWeight(.medium)
        .foregroundColor(Color.neutral50)
        .frame(height: 48)
    }
}

struct TransactionCardSmallView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCardSmallView(transaction: MockData.mockTranactionsDay.first!)
    }
}
