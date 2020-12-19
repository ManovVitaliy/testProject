//
//  ReservationsListPresenter.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationsListPresenterProtocol: class {
    
}

protocol ReservationsListPresenterDelegate {
    
}

class ReservationsListPresenter {
    //MARK: - properties
    weak var view: ReservationsListViewControllerProtocol?
    var delegate: ReservationsListPresenterDelegate?
    var model: ReservationsListModel?
    
    init(view: ReservationsListViewControllerProtocol?, delegate: ReservationsListPresenterDelegate?) {
        self.view = view
        self.delegate = delegate
        self.model = ReservationsListModel(delegate: self)
    }
}

extension ReservationsListPresenter: ReservationsListPresenterProtocol {

}

extension ReservationsListPresenter: ReservationsListModelDelegate {
    
}
