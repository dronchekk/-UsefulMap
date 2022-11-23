//
//  LoginViewModel.swift
//  UsefullMap
//
//  Created by Eduard on 21.11.2022.
//

import  SwiftUI

class LoginViewModel: ObservableObject {
    @Published var isSuccessfulAuthorization = false
    @Published var isTappedSkip = false
}
