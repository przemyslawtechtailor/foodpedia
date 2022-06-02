//
//  Legend.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 30/05/2022.
//

import Foundation

import SwiftUI

extension Design {
    
    struct Legend: View {
        var title: String
        var value: String
        
        var body: some View {
            VStack(spacing: 4) {
                Text(title)
                    .font(.custom("Avenir-Light", size: 14))
                    .foregroundColor(Color("gray"))
                Rectangle()
                    .frame(width: 60, height: 1, alignment: .center)
                    .foregroundColor(Color("grayLight"))
                Text(value)
                    .font(.custom("Avenir-Light", size: 14))
                    .foregroundColor(Color("gray"))
            }
        }
    }
    
}
