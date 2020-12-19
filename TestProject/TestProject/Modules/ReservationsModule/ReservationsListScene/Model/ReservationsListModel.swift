//
//  ReservationsListModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationsListModelDelegate: class {
    
}

class ReservationsListModel {
    var delegate: ReservationsListModelDelegate?
    
    init(delegate: ReservationsListModelDelegate?) {
        self.delegate = delegate
    }
}
