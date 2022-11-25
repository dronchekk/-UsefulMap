//
//  PlacesView.swift
//  UsefulMap
//
//  Created by Eduard on 24.11.2022.
//

import SwiftUI

//MARK: - Test Models
struct TestPlace: Identifiable {
    let id: Int
    let name: String
    let type: TestType
    let address: String
    let latitude: Float
    let longitude: Float
    let photo: String
    var distance: Float?
}

enum TestType: String {
    case bar
    case restaurant
    case cafe
    case club
}

struct PlacesView: View {
    
    //MARK: - Properties
    
    let navigationController: UINavigationController
    let coordinator: Coordinator
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let cityName = "Москва"
    let places = [TestPlace(id: 1, name: "Обломов", type: .bar, address: "Innstraße 16", latitude: 48.22637450447202, longitude: 16.393470902887316, photo: "https://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkQ6a9tgNJQVhqs5u-LotkQKaKTM5SRkZCeTgDn6uOyic"), TestPlace(id: 2, name: "Loft", type: .restaurant, address: "Innstraße 16", latitude: 48.22637450447202, longitude: 16.393470902887316, photo: "https://ortgraph.ru/upload/medialibrary/019/01957eb691d8407e71da1259aceda358.jpg"), TestPlace(id: 3, name: "Hello Bar", type: .bar, address: "Innstraße 16", latitude: 48.22637450447202, longitude: 16.393470902887316, photo: "https://www.silver.ru/upload/medialibrary/6e5/6e5bf80aac2ae6cbd3161f382f806f9b.jpg", distance: 0.4)]
    
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
                Text(cityName)
                    .font(.title2)
                    .padding(.leading, 28)
                    .padding(.trailing, 12)
                Spacer()
                Button {
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .foregroundColor(.black)
                }
            }//-HStack
            .padding(.horizontal)
            List(places) { place in
                ListPlaceItemView(place: place)
                    .listRowBackground(Color.clear)
                    .onTapGesture {
                        coordinator.openPlaceView()
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
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(navigationController: UINavigationController(), coordinator: Coordinator(navigationController: UINavigationController()))
    }
}
