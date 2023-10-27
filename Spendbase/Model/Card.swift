//
//  Card.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let serviceName: String
    let cardNumber: CardNumber
    let history: [HistoryDay]
}

struct HistoryDay: Identifiable {
    let id = UUID()
    let date: String
    let transactions: [TransactionDay]
}

struct TransactionDay: Identifiable {
    let id = UUID()
    let serviceName: String
    let sum: Double
    let isSuccess: Bool
    let isDeclined: Bool
}

struct Transaction: Identifiable {
    let id = UUID()
    let serviceName: String
    let cardNumber: CardNumber
    let sum: Double
    let isSuccess: Bool
    let isDeclined: Bool
}
