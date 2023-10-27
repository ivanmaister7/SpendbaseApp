//
//  TranactionCardListView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct TranactionCardListView: View {
    var history: [HistoryDay]
    
    var body: some View {
        ZStack {
            Color.white
            List {
                listTitle
                ForEach(history) { day in
                    dateCell(day: day)
                    ForEach(day.transactions) { transaction in
                        transactionCell(transaction: transaction)
                    }
                }
            }
            .listStyle(.plain)
        }
        .cornerRadius(16)
        .padding(.all, 16)
    }
    
    var listTitle: some View  {
        HStack {
            Spacer()
            Text("Activity")
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .frame(height: 100)
                .offset(y: 10)
            Spacer()
        }
        .listRowSeparator(.hidden)
    }
    
    func dateCell(day: HistoryDay) -> some View {
        VStack {
            HStack {
                Text(day.date)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.neutral500)
                Spacer()
            }
            Color.neutral500
                .frame(height: 0.5)
        }
    }
    
    func transactionCell(transaction: TransactionDay) -> some View {
        HStack {
            TransactionCardSmallView(transaction: transaction)
            Spacer()
            TransactionSumView(transactionSum: transaction.sum,
                               transactionIsSuccess: transaction.isSuccess,
                               transactionIsDeclined: transaction.isDeclined)
        }
            .listRowSeparator(.hidden)
    }
}

struct TranactionCardListView_Previews: PreviewProvider {
    static var previews: some View {
        TranactionCardListView(history: MockData.mockHistory)
    }
}
