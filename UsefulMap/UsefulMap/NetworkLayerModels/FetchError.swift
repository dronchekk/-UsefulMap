//
//  FetchError.swift
//  UsefullMap
//
//  Created by Andrey Rachitskiy on 24.11.2022.
//

import Foundation

enum FetchError: Error {
    case decoderError
    case bedUrl
    case invalidStatusCode
}
