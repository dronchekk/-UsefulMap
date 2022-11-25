//
//  ListPlaceItemView.swift
//  UsefulMap
//
//  Created by Dmitry Zasenko on 24.11.22.
//

import SwiftUI

struct ListPlaceItemView: View  {
    
    let place: TestPlace
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: place.photo)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            VStack(alignment: .leading) {
                Text(place.name)
                    .bold()
                Text(place.type.rawValue)
                Text(place.address)
                if let distance = place.distance {
                    Text("Дистанция: ") + Text(String(distance))
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(width: 8)
                .foregroundColor(.gray)
        }
    }
}
