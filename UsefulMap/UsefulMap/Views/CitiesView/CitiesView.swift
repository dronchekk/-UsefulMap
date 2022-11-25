//
//  CitiesView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct CitiesView: View {
    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    var body: some View {
        ZStack{
            //Кнопка перехода на следующий (любой из экранов) в стеке координатора
            Button(action: {
                coordinator.openPlacesView()
            }, label: {
            })
        }
        .onAppear() {
            //этот модификатор и вызов в нем нижеуказаного метода нужен чтобы убрать в левом верхнем углу экрана кнопку <Back
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}


