//
//  LoginView.swift
//  UsefullMap
//
//  Created by Eduard on 20.11.2022.
//

import SwiftUI

struct LoginView: View {
    
    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    private let backgroundImageName = "IMG_0001"
    
    var body: some View {
        ZStack{
            Image(backgroundImageName)
                .resizable()
                .ignoresSafeArea()
                .blur(radius: (5))
        }
        .onAppear() {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}
