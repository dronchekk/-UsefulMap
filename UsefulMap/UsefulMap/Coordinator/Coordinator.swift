//
//  Coordinator.swift
//  UsefullMap
//
//  Created by Eduard on 16.11.2022.
//

import UIKit
import SwiftUI

class Coordinator: CoordinatorProtocol {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let launchView = LaunchView(navigationController: navigationController, coordinator: self)
        let launchViewController = UIHostingController(rootView: launchView)
        navigationController.pushViewController(launchViewController, animated: true)
    }
    
    
    func openAboutViewOrLoginView(){
        if AppinfoViewModel.share.isFirstTime {
            let aboutAppView = AboutAppView (navigationController: self.navigationController, coordinator: self)
            let aboutAppViewController = UIHostingController(rootView: aboutAppView)
            self.navigationController.pushViewController(aboutAppViewController, animated: true)
        }
        else {
            let loginView = LoginView (navigationController: self.navigationController, coordinator: self)
            let loginViewController = UIHostingController(rootView: loginView)
            self.navigationController.pushViewController(loginViewController, animated: true)
        }
    }

}
