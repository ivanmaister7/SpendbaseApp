//
//  CardView.swift
//  Spendbase
//
//  Created by Master on 26.10.2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            baseLineShadow
                .padding(.horizontal, 16)
            cardShadow
            ZStack {
                cardTop
                cardBottom
                bottomWhiteShadow
                baseLineShadow
            }
            .padding(.horizontal, 64)
        }
    }
    
    var cardTop: some View {
        VStack {
            HStack {
                spendbaseLogo
                Spacer()
                mastercardLogo
                    .padding(.trailing, 8)
            }
            .padding(.all, 16)
            Spacer()
        }
        .frame(height: 180)
        .foregroundColor(.white)
        .background(Color.neutral800)
        .overlay(overlay)
        .cornerRadius(16)
        .offset(y: -10)
    }
    
    var cardBottom: some View {
        HStack {
            actionBarButton(imageName: "eye", text: "Details")
            Spacer()
            actionBarButton(imageName: "lock", text: "Lock")
            Spacer()
            actionBarButton(imageName: "rectangle.slash", text: "Terminate")
        }
        .frame(height: 60)
        .foregroundColor(Color.neutral800)
        .padding()
        .background(.white)
        .overlay(overlay)
        .cornerRadius(16)
        .shadow(radius: 2, y: 3)
        .offset(y: 45)
    }
    
    var overlay: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.black.opacity(0.5), lineWidth: 1)
    }
    
    var baseLineShadow: some View {
        topBottomLinearGradient(with: [.E7E9EB, .clear])
            .frame(height: 8)
    }
    
    var cardShadow: some View {
        topBottomLinearGradient(with: [.clear, .black])
            .frame(height: 60)
            .cornerRadius(16)
            .offset(y: -38)
            .blur(radius: 14)
            .padding(.horizontal, 56)
    }
    
    var bottomWhiteShadow: some View {
        topBottomLinearGradient(with: [.white])
            .frame(height: 24)
            .offset(y: 6)
    }
    
    var spendbaseLogo: some View {
        HStack {
            Image("spendbaseLogo")
                .resizable()
                .frame(width: 15, height: 20)
            Text("spendbase")
                .font(.title2)
        }
    }
    var mastercardLogo: some View {
        ZStack {
            Circle()
                .fill(.red)
                .offset(x: -10, y: 0)
            
            Circle()
                .fill(.yellow)
                .offset(x: 10, y: 0)
            
            Circle()
                .fill(.red.opacity(0.5))
                .offset(x: -10, y: 0)
        }
        .frame(width: 30, height: 30)
    }
    
    func actionBarButton(imageName: String, text: String) -> some View {
        Button {
            print("Button \(imageName) with text \(text) pressed.")
        } label: {
            VStack {
                Spacer()
                Image(systemName: imageName)
                    .font(.system(size: 18))
                Spacer()
                Text(text)
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                Spacer()
            }
            .padding(.top, 16)
        }
    }
    
    func topBottomLinearGradient(with colors: [Color]) -> LinearGradient {
        LinearGradient(
            colors: colors,
            startPoint: .top,
            endPoint: .bottom)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
