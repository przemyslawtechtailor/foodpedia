//
//  ProgressBar.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 30/05/2022.
//

import SwiftUI

extension Design {
    struct ProgressBar: View {
        @Binding var value: Float

        var body: some View {
                ZStack(alignment: .leading) {
                    GeometryReader { geometry in
                    Rectangle().frame(width: min(CGFloat(value) * geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(.white.opacity(0.6))
                            .cornerRadius(10)
                }
                .frame(height: 30)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 1))
                                            
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            Design.ProgressBar()

        }.padding()
            .preferredColorScheme(.dark)
    }
}
