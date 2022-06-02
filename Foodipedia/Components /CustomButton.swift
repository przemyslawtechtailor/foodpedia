//
//  CustomButton.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 29/05/2022.
//

import SwiftUI

extension Design {
    struct CustomButton: View {
        var text: String

        @Binding var isDisabled: Bool

        var body: some View {
            Text(text)
                .kerning(2)
                .font(.custom("Avenir-Light", size: 16))
                .foregroundColor(Color("white"))
                .frame(maxWidth: 287, maxHeight: 75)
                .background(LinearGradient(colors: [Color("button"), Color("buttonDark")], startPoint: .top, endPoint: .bottom).opacity(isDisabled ? 0.3 : 1)
                    .cornerRadius(100.0)
                    .shadow(color: Color("buttonShadows"), radius: 27, x: 0, y: 16))
        }
    }
}
