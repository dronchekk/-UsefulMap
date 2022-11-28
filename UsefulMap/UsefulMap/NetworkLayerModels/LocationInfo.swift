//
//  LocationInfo.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

struct LocationInfo: Codable {
    var id: Int
    var name: String
    var type: String
    var address: String
    var latitude: Float
    var longitude: Float
    var photo: String
    var distance: Float
    var country: String
    var city: String
    var description: String
    var www: String
    var phone: Int
    var comments: Comments?
}

struct Comments: Codable {
    var id: Int
    var text: String
    var user_name: String
    var date: Date
    var likes_count: Int
}
