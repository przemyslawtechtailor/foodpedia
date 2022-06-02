//
//  CustomText.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 30/05/2022.
//

import SwiftUI

extension Design {
    struct Texts {}
}

extension Design.Texts {
    struct DefaultText: View {
        var text: String
        var size: CGFloat

        var body: some View {
            SwiftUI.Text(text)
                .font(.custom("Avenir-Light", size: size))
                .foregroundColor(Color("white"))
                
        }
    }
    
    struct ItalicText: View {
        var text: String
        var size: CGFloat

        var body: some View {
            SwiftUI.Text(text)
                .font(.custom("Avenir-Light", size: size))
                .foregroundColor(Color("white"))
                .italic()
                
                
        }
    }
    
    
}
