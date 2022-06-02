//
//  ShakeToBeginView.swift
//  Foodipedia
//
//  Created by Przemysław Wośko on 02/06/2022.
//

import Foundation
import SwiftUI

struct ShakeToBeginView: View {
    var body: some View {
        ZStack {
            Color("greenLight")
                .edgesIgnoringSafeArea(.all)

            Text("Shake your phone to begin")
                .kerning(2)
                .font(.custom("Avenir", size: 24))
        }
    }
}
