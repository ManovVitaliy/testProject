//
//  ReservationsListModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationsListModelDelegate: class {
    func hadleGetReservationTypesResponse(reservationTypes: [ReserevationTypeEntity])
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
    
    func getReservationTypes() {
        let types = generateReservationTypes()
        delegate?.hadleGetReservationTypesResponse(reservationTypes: types)
    }
}

extension ReservationsListModel {
    private func generateReservationTypes() -> [ReserevationTypeEntity] {
        var types = [ReserevationTypeEntity]()
        
        let all = ReserevationTypeEntity()
        all.type = .all
        all.isSelected = true
        types.append(all)
        
        let ebike = ReserevationTypeEntity()
        ebike.type = .ebike
        ebike.isSelected = false
        types.append(ebike)
        
        let publicTransport = ReserevationTypeEntity()
        publicTransport.type = .publicTransport
        publicTransport.isSelected = false
        types.append(publicTransport)
        
        let shuttle = ReserevationTypeEntity()
        shuttle.type = .shuttle
        shuttle.isSelected = false
        types.append(shuttle)
        
        return types
    }
}
