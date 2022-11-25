//
//  PlacesRadList.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

struct PlacesRadList: Codable {
    var id: Int
    var name: String
    var type: String
    var address: String
    var latitude: Float
    var longitude: Float
    var photo: String
    var distance: Float
}
