//
//  LaunchView.swift
//  UsefullMap
//
//  Created by Eduard on 16.11.2022.
//

import SwiftUI


struct LaunchView: View {
    
    let navigationController: UINavigationController
    let coordinator: Coordinator

    @State var enlargeAndRotateLogo = false
    @State var rotateLogo = false
    @State var moveLogoAndShowAppName = false
    @State var showAppName = false
    
    let logoSize = GlobalProperties.share.logoSize
    let decreaseLogo: CGFloat = 3
    let increaseForAppName: CGFloat = 3
    let timeForRoutate:Double = 1


    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Group {
                Image("UsefulMap (text, white)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: logoSize*0.65)
                    .offset(x: moveLogoAndShowAppName ? logoSize*increaseForAppName/6 : -logoSize*(increaseForAppName-0.5), y: 0)
                Rectangle()
                    .foregroundColor(.black)
                    .frame(width: logoSize*increaseForAppName, height: logoSize, alignment: .center)
                    .offset(x: -logoSize*(increaseForAppName-0.5) , y: 0)
                VStack {
                    Image("IMG_0004")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: enlargeAndRotateLogo ? logoSize : logoSize/decreaseLogo, maxHeight: enlargeAndRotateLogo ? logoSize : logoSize/decreaseLogo)
                        .rotationEffect(enlargeAndRotateLogo ? Angle(degrees: -20) : Angle(degrees: 20))
                        .rotationEffect(rotateLogo ? Angle(degrees: 20) : Angle(degrees: -20))
                        .offset(x: moveLogoAndShowAppName ? -logoSize*1.5 : 0, y: 0)
                }
            }
            .padding(.bottom, logoSize)
            .onAppear(){
                withAnimation(Animation.easeInOut(duration: timeForRoutate)) {enlargeAndRotateLogo = true }
                DispatchQueue.main.asyncAfter(deadline: .now()+timeForRoutate) {
                    withAnimation(Animation.easeInOut(duration: timeForRoutate/2)) {rotateLogo = true }
                    DispatchQueue.main.asyncAfter(deadline: .now()+timeForRoutate/2) {
                        withAnimation(Animation.easeInOut(duration: timeForRoutate/4)) {moveLogoAndShowAppName = true }
                        DispatchQueue.main.asyncAfter(deadline: .now()+timeForRoutate*2) {
//                            ClearUserDefaults().clear()
                            coordinator.openAboutViewOrLoginView()
                        }
                    }
                }
            }
        }
    }
}

