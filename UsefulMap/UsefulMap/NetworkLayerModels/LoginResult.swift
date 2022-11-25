//
//  LoginResult.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

struct LoginResult: Codable {
    var result: Int = 0
    var error: String? = nil
    var user: User? = nil
}

struct User: Codable {
    var id: UInt? = nil
    var name: String = ""
    var liked_comments: [Comment] = []
    var saved_places: [Place] = []
}

struct Comment: Codable {
    var id: UInt = 0
}

struct Place: Codable {
    var id: UInt = 0
}
