//
//  PartnerCircleView.swift
//  Spendbase
//
//  Created by Master on 27.10.2023.
//

import SwiftUI

enum Partner: String {
    case google, slack, notion, income, unknown
    
    init(for name: String) {
        switch name.lowercased() {
        case "google": self = .google
        case "slack": self = .slack
        case "notion": self = .notion
        case "income": self = .income
        default: self = .unknown
        }
    }
}

struct PartnerCircleView: View {
    let imageName: Partner
    
    var body: some View {
        ZStack {
            Circle()
            Image(imageName.rawValue)
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.neutral800)
        }
    }
}

struct PartnerCircleView_Previews: PreviewProvider {
    static var previews: some View {
        PartnerCircleView(imageName: .google)
    }
}
