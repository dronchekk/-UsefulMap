//
//  СountriesView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct СountriesView: View {
    
    //MARK: - Properties
    
    let navigationController: UINavigationController
    let coordinator: Coordinator
    let сountries = ["Россия", "Португалия", "Германия"]
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Страны")
                    .font(.title2)
                    .padding(.leading, 28)
                Spacer()
                Button {
                    //открыть меню
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .foregroundColor(.black)
                }
            }//-HStack
            .padding()
            List(сountries, id: \.self) { country in
                ListItemView(text: country)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        coordinator.openCitiesView()
                    }
            }//-List
            .listStyle(.plain)
        }//-VStack
        .padding()
        .background(
            Image("IMG_0001")
                .resizable()
                .blur(radius: 10)
                .ignoresSafeArea()
        )
        .onAppear() {
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }//-body
}

struct СountriesView_Previews: PreviewProvider {
    static var previews: some View {
        СountriesView(navigationController: UINavigationController(), coordinator: Coordinator(navigationController: UINavigationController()))
    }
}
