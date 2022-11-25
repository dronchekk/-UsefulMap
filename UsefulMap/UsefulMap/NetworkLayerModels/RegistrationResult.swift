//
//  RegistrationResult.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

struct RegistrationResult: Codable {
    var result: Int = 0
    var error: String? = nil
    var user: UserReg? = nil
}

struct UserReg: Codable {
    var id: UInt? = nil
    var name: String = ""
}
