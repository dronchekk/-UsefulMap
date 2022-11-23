//
//  AboutAppView.swift
//  UsefullMap
//
//  Created by Eduard on 18.11.2022.
//

import SwiftUI


struct AboutAppView: View {

    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    @State var moveSubviewWithGesture:CGFloat = 0
    @State private var rect: CGRect = CGRect()
    @State var isGesturesAllowed = false
    @State var currentSubviewNumber:CGFloat = 0
    
    private let screeenWidth = UIScreen.main.bounds.width
    private let timeToOffset:Double = 2
    private let appImageWidth: CGFloat = 200
    private let whatAppDoes: [(String,String)] = [("IMG_0005","Просмотр ближайших от тебя баров, кафе, а также ресторанов"),
                                                  ("IMG_0006", "Добавление любимых локаций в избранное"),
                                                  ("IMG_0007","Просмотр озывов других пользователей, а также добавление своих")]
    
    var body: some View {
        VStack{
            Spacer().frame(height:20)
            LogoSubView()
            ZStack{
                AboutAppSubView(appImageWidth: appImageWidth, text:whatAppDoes[0].1, imageName: whatAppDoes[0].0, rect: $rect)
                    .offset(x: 0, y: 0)
                AboutAppSubView(appImageWidth: appImageWidth, text:whatAppDoes[1].1, imageName: whatAppDoes[1].0, rect: $rect)
                    .offset(x: screeenWidth, y: 0)
                AboutAppSubView(appImageWidth: appImageWidth, text:whatAppDoes[2].1, imageName: whatAppDoes[2].0, rect: $rect)
                    .offset(x: screeenWidth*2, y: 0)
            }
            .background(GeometryGetter(rect: $rect))
            .offset(x:moveSubviewWithGesture - screeenWidth*currentSubviewNumber, y:0)
            .gesture(
                DragGesture(minimumDistance: 5)
                    .onChanged({ value in
                        if (abs(value.translation.width) > value.translation.height) && isGesturesAllowed {
                            moveSubviewWithGesture = value.translation.width
                        }
                    })
                    .onEnded({ value in
                        if (abs(value.translation.width) < screeenWidth/2) && isGesturesAllowed {
                            moveSubviewWithGesture = .zero
                        } else if isGesturesAllowed {
                            switch (value.translation.width, currentSubviewNumber) {
                            case (-screeenWidth...0, 0) :
                                currentSubviewNumber = 1
                                moveSubviewWithGesture = .zero
                            case (-screeenWidth...0, 1) :
                                currentSubviewNumber = 2
                                moveSubviewWithGesture = .zero
                            case (-screeenWidth...0, 2) :
                                currentSubviewNumber = 2
                                moveSubviewWithGesture = .zero
                            case (0...screeenWidth, 0) :
                                currentSubviewNumber = 0
                                moveSubviewWithGesture = .zero
                            case (0...screeenWidth, 1) :
                                currentSubviewNumber = 0
                                moveSubviewWithGesture = .zero
                            case (0...screeenWidth, 2) :
                                currentSubviewNumber = 1
                                moveSubviewWithGesture = .zero
                            default:
                                return
                            }
                        }
                    })
            )
            Spacer().frame(height:30)
            HStack {
                Spacer()
                FlashingCircle(currentSubviewNumber: $currentSubviewNumber, circleNumber: 0)
                FlashingCircle(currentSubviewNumber: $currentSubviewNumber, circleNumber: 1)
                FlashingCircle(currentSubviewNumber: $currentSubviewNumber, circleNumber: 2)
                Spacer()
            }
            Spacer().frame(height:80)
            Button(action: {
                AppinfoViewModel.share.isFirstTime = false
                coordinator.openAboutViewOrLoginView()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 250, height: 40)
                        .foregroundColor(.red)
                        .opacity(0.6)
                    Text("Давайте начинать")
                        .bold()
                        .foregroundColor(.white)
                }
            })
            Spacer().frame(height:60)
        }
        .onAppear() {
            navigationController.setNavigationBarHidden(true, animated: false)
            DispatchQueue.main.asyncAfter(deadline: .now()+timeToOffset) {
                withAnimation(Animation.easeInOut(duration: timeToOffset/3)) {currentSubviewNumber = 1 }
                DispatchQueue.main.asyncAfter(deadline: .now()+timeToOffset) {
                    withAnimation(Animation.easeInOut(duration: timeToOffset/3)) {currentSubviewNumber = 2}
                    DispatchQueue.main.asyncAfter(deadline: .now()+timeToOffset) {
                        isGesturesAllowed = true
                        withAnimation(Animation.easeInOut(duration: timeToOffset/9)) {currentSubviewNumber = 0}
                        
                    }
                }
            }
        }
    }
}


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
