//
//  ReservationsListPresenter.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationsListPresenterProtocol: class {
    func getReservationTypes()
    func getReservations()
    func getReservationsWith(type: ReservationType, allReservations: [ReservationProtocol])
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
    func getReservationTypes() {
        model?.getReservationTypes()
    }
    
    func getReservations() {
        model?.getReservations()
    }
    
    func getReservationsWith(type: ReservationType, allReservations: [ReservationProtocol]) {
        var filteredReservations = [ReservationProtocol]()
        switch type {
        case .all:
            filteredReservations = allReservations
        case .ebike:
            filteredReservations = allReservations.filter({ (reservationProtocol) -> Bool in
                return reservationProtocol.type == TransportType.e_bike
            })
        case .publicTransport:
        filteredReservations = allReservations.filter({ (reservationProtocol) -> Bool in
            return reservationProtocol.type == TransportType.public_transport
        })
        case .shuttle:
            filteredReservations = allReservations.filter({ (reservationProtocol) -> Bool in
                return reservationProtocol.type == TransportType.shuttle
            })
        }
        view?.updateFilteredReservations(reservations: filteredReservations)
    }
}

extension ReservationsListPresenter: ReservationsListModelDelegate {
    func hadleGetReservationTypesResponse(reservationTypes: [ReserevationTypeEntity]) {
        view?.typesWereGotten(types: reservationTypes)
    }
    
    func hadleGetReservationsListResponse(reservations: [ReservationProtocol]) {
        view?.needUpdateTableViewWith(reservations: reservations)
    }
}
