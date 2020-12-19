//
//  ReservationsListModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationsListModelDelegate: class {
    func hadleGetReservationsListResponse(reservations: [ReservationProtocol])
}

class ReservationsListModel {
    var delegate: ReservationsListModelDelegate?
    
    init(delegate: ReservationsListModelDelegate?) {
        self.delegate = delegate
    }
    
    func getReservations() {
        let mapReservationService = MapReservationsService()
        guard let reservationsList = mapReservationService.getReservationsFrom(resourceName: "reservations", resourceExtension: "json") else { return }
        delegate?.hadleGetReservationsListResponse(reservations: reservationsList)
    }
}
