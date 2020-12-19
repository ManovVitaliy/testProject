//
//  ReservationsModuleCoordinator.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class ReservationsModuleCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    func start() {
        showReservationsListScene()
    }
}

extension ReservationsModuleCoordinator {
    func showReservationsListScene() {
        let signInScene = ReservationsModuleFactory.makeReservationsListScene(delegate: self)
        navigationController.viewControllers = [signInScene]
    }
}

extension ReservationsModuleCoordinator: ReservationsListPresenterDelegate {
    
}
