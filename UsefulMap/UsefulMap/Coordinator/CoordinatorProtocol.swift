//
//  CoordinatorProtocol.swift
//  UsefullMap
//
//  Created by Eduard on 16.11.2022.
//

import UIKit

protocol CoordinatorProtocol: AnyObject {
    var navigationController: UINavigationController { get }
    
    func start()
}

