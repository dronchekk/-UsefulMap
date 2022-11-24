//
//  ClearUserDefaultsMethod.swift
//  UsefullMap
//
//  Created by Eduard on 19.11.2022.
//

import Foundation

class ClearUserDefaults {
    
    func clear(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
