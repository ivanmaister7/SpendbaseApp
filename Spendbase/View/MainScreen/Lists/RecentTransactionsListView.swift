//
//  RecentTransactionsListView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct RecentTransactionsListView: View {
    var list: [Transaction]
    var seeAllButtonAction: () -> Void
    
    var body: some View {
        List{
            HStack {
                Text("Recent transactions")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    seeAllButtonAction()
                } label: {
                    Text("See All")
                        .font(.system(size: 14))
                        .fontWeight(.medium)
                        .underline()
                }
            }
            ForEach(list) { transaction in
                    HStack {
                        TransactionSmallView(transaction: transaction)
                        Spacer()
                        TransactionSumView(transactionSum: transaction.sum,
                                           transactionIsSuccess: transaction.isSuccess,
                                           transactionIsDeclined: transaction.isDeclined)
//                        if this row will be link on transactions menu or other menu
//                        NavigationLink(destination: CardView()) { EmptyView() }
//                            .opacity(0)
                    }
                    .listRowSeparator(.hidden)
            }
        }
        .frame(height: 250)
        .listStyle(.plain)
        .cornerRadius(16)
        .scrollDisabled(true)
    }
}

struct RecentTransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionsListView(list: MockData.mockRequest2, seeAllButtonAction: {})
    }
}
