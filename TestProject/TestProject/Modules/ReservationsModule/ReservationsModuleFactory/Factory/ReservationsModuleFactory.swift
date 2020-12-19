//
//  ReservationsModuleFactory.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

struct ReservationsModuleFactoryKeys {
    static let reservationsStoryboardName = "Reservations"
    
    static let reservationsListViewControllerId = "ReservationsListViewController"
}

struct ReservationsModuleFactory {
    static func makeReservationsListScene(delegate: ReservationsListPresenterDelegate?) -> ReservationsListViewController {
        let viewController = UIStoryboard(name: ReservationsModuleFactoryKeys.reservationsStoryboardName, bundle: nil).instantiateViewController(withIdentifier: ReservationsModuleFactoryKeys.reservationsListViewControllerId) as! ReservationsListViewController
        let presenter = ReservationsListPresenter(view: viewController, delegate: delegate)
        viewController.presenter = presenter
        
        return viewController
    }
}
