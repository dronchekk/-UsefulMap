//
//  FlashingCircle.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct FlashingCircle: View {
    
    let circleSize:CGFloat = 10
    
    @Binding var currentSubviewNumber:CGFloat
    let circleNumber:CGFloat
    
    var body: some View {
        Circle()
            .overlay(
                Circle()
                    .stroke(Color.red,lineWidth: 2)
                    .opacity(0.3)
            )
            .foregroundColor(currentSubviewNumber == circleNumber ? .red : .white)
            .opacity(0.3)
            .frame(width: circleSize)
            .padding(5)
    }
}

