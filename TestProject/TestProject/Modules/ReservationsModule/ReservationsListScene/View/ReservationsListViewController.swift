//
//  ReservationsListViewController.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

protocol ReservationsListViewControllerProtocol: class {
    func needUpdateTableViewWith(reservations: [ReservationProtocol])
}

class ReservationsListViewController: UIViewController {
    //MARK: - outlets
    
    //MARK: - properties
    weak var presenter: ReservationsListPresenterProtocol?
    
    //MARK: - viewcontroller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getReservations()
    }
    
    //MARK: - appearance
}

extension ReservationsListViewController: ReservationsListViewControllerProtocol {
    func needUpdateTableViewWith(reservations: [ReservationProtocol]) {
        print(reservations)
    }
}

extension ReservationsListViewController {
    
}
