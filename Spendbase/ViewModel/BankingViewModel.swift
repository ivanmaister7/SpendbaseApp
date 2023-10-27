//
//  BankingViewModel.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import Foundation
import Combine

final class BankingViewModel: ObservableObject {
    var loadedPage: PassthroughSubject<Void, Never> = .init()
    @Published var lastThreeCards: [Card] = []
    @Published var lastThreeTransactions: [Transaction] = []
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        loadedPage
            .flatMap {
                BankingAPI.shared.fetchLastThreeCards()
            }
            .assign(to: \.lastThreeCards, on: self)
            .store(in: &self.cancellableSet)
        loadedPage
            .flatMap {
                BankingAPI.shared.fetchLastThreeTransactions()
            }
            .assign(to: \.lastThreeTransactions, on: self)
            .store(in: &self.cancellableSet)
    }
    
}
