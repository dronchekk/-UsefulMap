//
//  LocationView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct LocationView: View {
    let navigationController: UINavigationController
    let coordinator: Coordinator
    
    @State private var isGrantedAccess = true
    
    var body: some View {
        ZStack{
            //Переход на MapView после успешного получения доступа к локации
            Button(action: {
                if isGrantedAccess {
                    coordinator.openMapView()
                } else {
                    coordinator.openCountriesView()
                }
            }, label: {
            })
        }
        .onAppear() {
            //этот модификатор и вызов в нем нижеуказаного метода нужен чтобы убрать в левом верхнем углу экрана кнопку <Back
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }
}

