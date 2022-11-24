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
    
    func openLocationView(){
        let locationView = LocationView(navigationController: navigationController, coordinator: self)
        let locationViewController = UIHostingController(rootView: locationView)
        navigationController.pushViewController(locationViewController, animated: true)
    }
    
    
    func openMapView(){
        let mapView = MapView(navigationController: navigationController, coordinator: self)
        let mapViewController = UIHostingController(rootView: mapView)
        navigationController.pushViewController(mapViewController, animated: true)
    }
    
    func openCountriesView(){
        let countriesView = СountriesView(navigationController: navigationController, coordinator: self)
        let countriesViewController = UIHostingController(rootView: countriesView)
        navigationController.pushViewController(countriesViewController, animated: true)
    }

    func openCitiesView(){
        let citiesView = CitiesView(navigationController: navigationController, coordinator: self)
        let citiesViewController = UIHostingController(rootView: citiesView)
        navigationController.pushViewController(citiesViewController, animated: true)
    }

    func openPlacesView(){
        let placesView = PlacesView(navigationController: navigationController, coordinator: self)
        let placesViewController = UIHostingController(rootView: placesView)
        navigationController.pushViewController(placesViewController, animated: true)
    }
    
    func openPlaceView(){
        let placeView = PlaceView(navigationController: navigationController, coordinator: self)
        let placeViewController = UIHostingController(rootView: placeView)
        navigationController.pushViewController(placeViewController, animated: true)
    }
    
}
