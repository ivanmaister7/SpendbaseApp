//
//  MockData.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import Foundation

struct MockData {
    static let mockTranactionsDay = [
        TransactionDay(
            serviceName: "Apple",
            sum: -1299,
            isSuccess: false,
            isDeclined: true),
        TransactionDay(
            serviceName: "Uber",
            sum: -37,
            isSuccess: false,
            isDeclined: false),
        TransactionDay(
            serviceName: "Hotels",
            sum: -320,
            isSuccess: true,
            isDeclined: false)]
    
    static let mockTranactionsDay2 = [
        TransactionDay(
            serviceName: "Glovo",
            sum: -39,
            isSuccess: true,
            isDeclined: true),
        TransactionDay(
            serviceName: "Uber",
            sum: -50.90,
            isSuccess: false,
            isDeclined: true),
        TransactionDay(
            serviceName: "Donat",
            sum: 23,
            isSuccess: true,
            isDeclined: false)]
    
    static let mockHistory = [HistoryDay(date: "Aug 27",
                                         transactions: MockData.mockTranactionsDay),
                              HistoryDay(date: "Aug 26",
                                         transactions: MockData.mockTranactionsDay2)]
    
    static let mockRequest1: [Card] = [Card(serviceName: "Slack",
                                            cardNumber: "7544",
                                            history: mockHistory),
                                       Card(serviceName: "Google",
                                            cardNumber: "2911",
                                            history: mockHistory),
                                       Card(serviceName: "Notion",
                                            cardNumber: "2233",
                                            history: mockHistory)]
    static let mockRequest2: [Transaction] = [Transaction(serviceName: "Slack",
                                                          cardNumber: "7544",
                                                          sum: -29.47,
                                                         isSuccess: true,
                                                          isDeclined: false),
                                              Transaction(serviceName: "Slack",
                                                          cardNumber: "7544",
                                                          sum: 1000,
                                                          isSuccess: true,
                                                          isDeclined: false),
                                              Transaction(serviceName: "Google",
                                                          cardNumber: "2911",
                                                          sum: -399,
                                                          isSuccess: true,
                                                          isDeclined: false)]
}
