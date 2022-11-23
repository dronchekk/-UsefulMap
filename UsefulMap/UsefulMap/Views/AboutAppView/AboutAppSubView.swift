//
//  AboutAppSubView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct AboutAppSubView: View {
    
    let appImageWidth: CGFloat
    let text: String
    let imageName: String
    let screeenWidth = UIScreen.main.bounds.width
    
    let lineWidthUnderWelcome: CGFloat  = 160
    let lineHeightUnderWelcome: CGFloat = 15
    let offsetLineUnderWelcome: CGFloat = 7
    
    @Binding var rect: CGRect
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.white)
                .frame(width: rect.width, height: rect.height)
            HStack{
                Spacer().frame(width:(UIScreen.main.bounds.width - appImageWidth)/2)
                VStack {
                    Spacer().frame(height:50)
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: appImageWidth)
                    Spacer().frame(height:20)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.red)
                            .opacity(0.3)
                            .frame(width: lineWidthUnderWelcome, height: lineHeightUnderWelcome)
                            .offset(x: 0 , y: offsetLineUnderWelcome)
                        Text("Добро пожаловать!")
                            .bold()
                            .font(.system(size: 16))
                    }
                    Spacer().frame(height:30)
                    Text(text)
                        .frame(width: appImageWidth)
                        .font(.system(size: 14))
                        .multilineTextAlignment(.center)
                    Spacer()
                    
                }
                Spacer().frame(width:(UIScreen.main.bounds.width - appImageWidth)/2)
            }
        }
    }
}
