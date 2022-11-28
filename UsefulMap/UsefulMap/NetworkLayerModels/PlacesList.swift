//
//  PlacesList.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

struct PlacesList: Codable {
    var id: Int
    var name: String
    var type: String
    var address: String
    var latitude: Float
    var longitude: Float
    var photo: String
}
