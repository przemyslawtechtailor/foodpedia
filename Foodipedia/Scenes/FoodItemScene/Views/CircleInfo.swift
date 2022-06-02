//
//  CircleInfo.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 28/05/2022.
//

import SwiftUI

struct CircleInfo: View {
    var foodName: String
    var calories: String

    @Binding var isInLoadingState: Bool

    var body: some View {
        ZStack {
            animatedCircle(isLoading: isInLoadingState)

            if !isInLoadingState {
                VStack(spacing: 0) {
                    Design.Texts.DefaultText(text: foodName, size: 20)
                        .padding(.bottom, 5)
                    Rectangle()
                        .frame(width: 85, height: 1, alignment: .center)
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    Design.Texts.DefaultText(text: calories, size: 60)
                    Design.Texts.ItalicText(text: "Calories per serving", size: 15)
                }
            }
        }.frame(width: 271, height: 271)
    }

    @ViewBuilder
    func animatedCircle(isLoading: Bool) -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 271, height: 271)
            .background(Circle()
                .fill(LinearGradient(colors: [Color("orangeCircle"), Color("redCircle")], startPoint: .leading, endPoint: .bottom))
                .shadow(color: Color("circleShadows"), radius: 24, x: 0, y: 8))
            .scaleEffect(isLoading ? 0.7 : 1)
            .animation(Animation.easeInOut.repeatForever().speed(0.5), value: isLoading)
            .transaction({ transaction in
                if !isLoading {
                    transaction.disablesAnimations = true
                }
            })
    }
}

struct CircleInfo_Previews: PreviewProvider {
    static var previews: some View {
        CircleInfo(foodName: "Cashews", calories: "400", isInLoadingState: .constant(false))
        CircleInfo(foodName: "Cashews", calories: "400", isInLoadingState: .constant(true))
    }
}
