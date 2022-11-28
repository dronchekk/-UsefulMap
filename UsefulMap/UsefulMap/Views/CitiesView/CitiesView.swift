//
//  CitiesView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

struct CitiesView: View {
    
    //MARK: - Properties
    
    let navigationController: UINavigationController
    let coordinator: Coordinator
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let cities = ["Москва", "Ростов", "Великий Новгород", "Сочи", "Челябинск"]
    let countryName = "Россия"
    
    //MARK: - Body
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                        .foregroundColor(.black)
                }
                Spacer()
                Text(countryName)
                    .font(.title2)
                    .padding(.leading, 28)
                    .padding(.trailing, 12)
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
            List(cities, id: \.self) { city in
                ListItemView(text: city)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        coordinator.openPlacesView()
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
            //этот модификатор и вызов в нем нижеуказаного метода нужен чтобы убрать в левом верхнем углу экрана кнопку <Back
            navigationController.setNavigationBarHidden(true, animated: false)
        }
    }//-body
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        CitiesView(navigationController: UINavigationController(), coordinator: Coordinator(navigationController: UINavigationController()))
    }
}
