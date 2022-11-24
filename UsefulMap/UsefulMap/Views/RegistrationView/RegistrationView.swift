//
//  RegistrationView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct RegistrationView: View {
    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    var body: some View {
        ZStack{
            //Кнопка перехода на LocationView после успешной регистрации
            Button(action: {
                coordinator.openLocationView()
            }, label: {
            })
        }
        .onAppear() {
            //этот модификатор и вызов в нем нижеуказаного метода нужен чтобы убрать в левом верхнем углу экрана кнопку <Back
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}


