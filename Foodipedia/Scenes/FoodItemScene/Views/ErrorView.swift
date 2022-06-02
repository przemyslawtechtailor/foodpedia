//
//  ErrorView.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation
import SwiftUI

struct ErrorView: View {
    var message: String
    
    var retryCallback: (() -> Void)
    var closeCallback: (() -> Void)
    
    var body: some View {
        ZStack {
            Color("orangeCircle")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Text(message)
                    .kerning(2)
                    .font(.custom("Avenir", size: 24))
                    .padding(.bottom, 40)
                
                
                    Button {
                        retryCallback()
                    } label: {
                        Design.CustomButton(text: "Retry", isDisabled: .constant(false))
                            .scaleEffect(0.7)
                    }
                Spacer()
                            
                Button {
                    closeCallback()
                } label: {
                    Text("Cancel")
                        .font(.custom("Avenir", size: 18))
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                }.padding(.bottom, 80)
            }
            
            
        }
    }
}
