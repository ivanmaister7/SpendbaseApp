//
//  MyCardsListView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

struct MyCardsListView: View {
    var list: [Card]
    var seeAllButtonAction: () -> Void
    
    var body: some View {
        List{
            HStack {
                Text("My cards")
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
            ForEach(list) { card in
                    HStack {
                        CardSmallView(card: card)
                        Spacer()
                        NavigationLink(destination: CardDetailView(card: card)) { EmptyView() }
                            .opacity(0)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.neutral800)
                            .padding(.trailing, 12)
                    }
                    .padding(.vertical, 8)
                    .listRowSeparator(.hidden)
                
            }
        }
        .frame(height: 250)
        .listStyle(.plain)
        .cornerRadius(16)
        .scrollDisabled(true)
    }
}

//struct ListWithTitleCellView<Content: View, Data: Identifiable>: View {
//    @State var list: [Data] {
//        didSet{
//            list.insert(list.first!, at: 0)
//        }
//    }
//    @ViewBuilder var title: () -> Content
//    @ViewBuilder var row: () -> Content
//    
//    var body: some View {
//        
//        List(list) {
//            $0.id == list.first?.id ? title() : row()
//        }
//        .frame(height: 250)
//        .listStyle(PlainListStyle())
//        .cornerRadius(16)
//        .scrollDisabled(true)
//    }
//}

//struct MyCardsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MyCardsListView(list: [Card(name: "Telegram", num: "1234")]) {}
//    }
//}
