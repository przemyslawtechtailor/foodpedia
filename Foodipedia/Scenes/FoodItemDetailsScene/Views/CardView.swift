//
//  CardView.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 30/05/2022.
//

import SwiftUI

struct CardView: View {
    var title: String
    var subtitle: String
    var progressValue: Float
    var progressDescription: String
    var colorType: FoodDetailsSceneModels.CardColorType

    var gradientStartColor: Color {
        switch colorType {
        case .green: return Color("greenLight")
        case .orange: return Color("orangeLight")
        case .purple: return Color("purple")
        }
    }

    var gradientEndColor: Color {
        switch colorType {
        case .green: return Color("green")
        case .orange: return Color("orange")
        case .purple: return Color("purple")
        }
    }

    var shadowColor: Color {
        switch colorType {
        case .green: return Color("greenShadows")
        case .orange: return Color("orangeShadows")
        case .purple: return Color("purpleShadows")
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            Design.Texts.DefaultText(text: title, size: 24)
                .padding(.bottom, 2)
            Design.Texts.DefaultText(text: subtitle, size: 14)
                .padding(.bottom, 20)
            Design.ProgressBar(value: .constant(progressValue))
                .padding(.horizontal, 50)
                .padding(.vertical, 8)
            Design.Texts.DefaultText(text: progressDescription, size: 14)
        }.frame(width: 268, height: 208.8)
            .background(Rectangle()
                .fill(LinearGradient(colors: [gradientStartColor, gradientEndColor], startPoint: .top, endPoint: .bottom))
                .cornerRadius(17)
                .shadow(color: shadowColor, radius: 20, x: 0, y: 10)
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(title: "CASHEWS", subtitle: "400 cals / serving", progressValue: 1, progressDescription: "65% of fat is unsaturated", colorType: .orange)
        CardView(title: "CASHEWS", subtitle: "400 cals / serving", progressValue: 0.62, progressDescription: "65% of fat is unsaturated", colorType: .green)
        CardView(title: "CASHEWS", subtitle: "400 cals / serving", progressValue: 0, progressDescription: "65% of fat is unsaturated", colorType: .purple)
    }
}
