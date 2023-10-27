//
//  BankingAPI.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import Foundation
import Combine

class BankingAPI {
    static let shared = BankingAPI()
    static let key = "84aaefc410e74b45aa2101435230910"
    let baseUrl = "https://api.spendbase.com/"
    
    func fetchLastThreeCards() -> AnyPublisher<[Card], Never> {
        Just(MockData.mockRequest1).eraseToAnyPublisher()
    }
    
    func fetchLastThreeTransactions() -> AnyPublisher<[Transaction], Never> {
        Just(MockData.mockRequest2).eraseToAnyPublisher()
    }
}
