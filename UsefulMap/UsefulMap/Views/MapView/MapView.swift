//
//  MapView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct MapView: View {
    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    var body: some View {
        ZStack{
            //Вью с информацией о локации, при нажатии на которую происходит переход на PlaceView
            EmptyView().onTapGesture {
                coordinator.openPlaceView()
            }
            // Аналогично здесь можно реализовать переход через Alert в СountriesView в случае, если локаций не обнаружено
        }
        .onAppear() {
            //этот модификатор и вызов в нем нижеуказаного метода нужен чтобы убрать в левом верхнем углу экрана кнопку <Back
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}

