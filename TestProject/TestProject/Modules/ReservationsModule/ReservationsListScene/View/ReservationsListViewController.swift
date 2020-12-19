//
//  ReservationsListViewController.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

protocol ReservationsListViewControllerProtocol: class {
    
}

class ReservationsListViewController: UIViewController {
    //MARK: - outlets
    
    //MARK: - properties
    weak var presenter: ReservationsListPresenterProtocol?
    
    //MARK: - viewcontroller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - appearance
}

extension ReservationsListViewController: ReservationsListViewControllerProtocol {
    
}

extension ReservationsListViewController {
    
}
