//
//  TransactionSumView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct TransactionSumView: View {
    var transactionSum: Double
    var transactionIsSuccess: Bool
    var transactionIsDeclined: Bool
    
    var body: some View {
        if transactionIsDeclined {
            Text(formatSum(transactionSum))
                .strikethrough()
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color.neutral500)
        } else {
            Text(formatSum(transactionSum))
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(transactionSum > 0 ? Color.green : Color.neutral800)
        }
        if transactionIsSuccess && !transactionIsDeclined {
            successIcon
        } else if !transactionIsSuccess && !transactionIsDeclined{
            unsuccessIcon
        } else {
            emptyIcon
        }
    }
    
    var successIcon: some View {
        Image("successIcon")
            .resizable()
            .frame(width: 18, height: 24)
            .padding(.horizontal, 4)
    }
    
    var unsuccessIcon: some View {
        Image("unsuccessIcon")
            .resizable()
            .frame(width: 18, height: 24)
            .padding(.horizontal, 4)
    }
    
    var emptyIcon: some View {
        Image(systemName: "rectangle.badge.xmark")
            .foregroundStyle(.clear, .clear)
            .padding(.horizontal, 4)
    }
    
    func formatSum(_ sum: Double) -> String {
        guard let s1 = String(format: "%.1f", transactionSum).last,
              let s2 = String(format: "%.2f", transactionSum).last else { return String(format: "%.0f", transactionSum) }
        
        var shortSum = String(format: "%.2f", transactionSum)
        if s1 == "0" && s2 == "0" {
            shortSum = String(format: "%.0f", transactionSum)
        }
        let index = sum < 0 ? 1 : 0
        
        shortSum.insert("$", at: shortSum.index(shortSum.startIndex, offsetBy: index))
        
        return shortSum
    }
}

struct TransactionSumView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionSumView(transactionSum: 0,
                           transactionIsSuccess: true,
                           transactionIsDeclined: false)
    }
}
