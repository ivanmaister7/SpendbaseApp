//
//  MainScreenView.swift
//  Spendbase
//
//  Created by Master on 26.10.2023.
//

import SwiftUI

struct MainScreenView: View {
    @ObservedObject var vm = BankingViewModel()
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection) {
            mainTab
            transactionsTab
            myCardsTab
            accountTab
        }.onAppear {
            vm.loadedPage.send()
        }
    }
    
    let toolbarItemMoney: ToolbarItem<(), Text> =
    ToolbarItem(placement: .navigationBarLeading) {
        Text("Money")
            .font(.system(size: 32))
            .fontWeight(.heavy)
    }
    
    let toolbarItemPlus: ToolbarItem<(), Button> =
    ToolbarItem(placement: .navigationBarTrailing) {
        Button {
            print("Tapped plus")
        } label: {
            Image(systemName: "plus")
        }
    }
    
    let toolbarItemHome: ToolbarItem<(), Button> =
    ToolbarItem(placement: .navigationBarTrailing) {
        Button {
            print("Tapped building.columns")
        } label: {
            Image(systemName: "building.columns")
        }
    }
    
    var mainTab: some View {
        NavigationStack {
            ZStack {
                Color.neutral50
                    .ignoresSafeArea(.container, edges: .top)
                VStack(spacing: 16) {
                    Divider()
                        .padding(.vertical, 8)
                    balanceAccountView
                    
                    MyCardsListView(list: vm.lastThreeCards) { self.tabSelection = 3 }
                    RecentTransactionsListView(list: vm.lastThreeTransactions) { self.tabSelection = 2 }
                    
                    Spacer()
                }
                .toolbar {
                    toolbarItemMoney
                    toolbarItemPlus
                    toolbarItemHome
                }
                .padding(.horizontal, 16)
            }
            .foregroundColor(.neutral800)
        }
        .tabItem {
            Image(systemName: "house")
            Text("Home")
        }
        .tag(1)
    }
    
    var transactionsTab: some View {
        Text("Transactions Screen")
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Transactions")
            }
            .tag(2)
    }
    
    var myCardsTab: some View {
        Text("My cards Screen")
            .tabItem {
                Image(systemName: "creditcard")
                Text("My cards")
            }
            .tag(3)
    }
    
    var accountTab: some View {
        Text("Account Screen")
            .tabItem {
                Image(systemName: "person.crop.square")
                Text("Account")
            }
            .tag(4)
    }
    
    var balanceAccountView: some View {
        ZStack {
            Color.white
                .cornerRadius(16)
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Text("🇺🇸 USD account")
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text("$100,000")
                        .font(.system(size: 28))
                        .fontWeight(.heavy)
                }
                .padding(.horizontal, 16)
                Spacer()
            }
        }
        .frame(height: 100)
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
