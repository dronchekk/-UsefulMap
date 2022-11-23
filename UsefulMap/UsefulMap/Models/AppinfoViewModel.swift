//
//  AppinfoViewModel.swift
//  UsefullMap
//
//  Created by Eduard on 19.11.2022.
//

import Foundation

class AppinfoViewModel {
    static let share = AppinfoViewModel()
    var isFirstTime:Bool {
        get {
            !UserDefaults.standard.bool(forKey: "isNotFirstTime")
        }
        set {
            UserDefaults.standard.set(true, forKey: "isNotFirstTime")
        }
    }
    private init(){}
}
