//
//  ReservationsListTableViewFactory.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class ReservationsListTableViewFactory {
    //MARK: - constants
    let ebikeTypeTableViewCellId = "EbikeTypeTableViewCell"
    let publicTransportTypeTableViewCellId = "PublicTransportTypeTableViewCell"
    let shuttleTypeTableViewCellId = "ShuttleTypeTableViewCell"

    func registerCellsAndSetupSettings(tableView: UITableView, ownerController: UIViewController) {
        tableView.dataSource = ownerController as? UITableViewDataSource
        tableView.delegate = ownerController as? UITableViewDelegate
        tableView.register(UINib(nibName: ebikeTypeTableViewCellId, bundle: nil), forCellReuseIdentifier: ebikeTypeTableViewCellId)
        tableView.register(UINib(nibName: publicTransportTypeTableViewCellId, bundle: nil), forCellReuseIdentifier: publicTransportTypeTableViewCellId)
        tableView.register(UINib(nibName: shuttleTypeTableViewCellId, bundle: nil), forCellReuseIdentifier: shuttleTypeTableViewCellId)
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.allowsSelection = true
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        tableView.contentInsetAdjustmentBehavior = .never
    }
    
    func returnHeightForRowAt(reservation: ReservationProtocol) -> CGFloat {
        
        switch reservation.type {
        case .e_bike:
            return 120.0
        case .shuttle:
            return 150.0
        case .public_transport:
            return 160.0
        }
    }
    
    func returnViewForFooterInSection(section: Int) -> UIView? {
        return UIView()
    }
    
    func returnNumberOfRowsIn(reservations: [ReservationProtocol]) -> Int {
        return reservations.count
    }
    
    func returnCellForRowAt(indexPath: IndexPath,
                            tableView: UITableView,
                            reservations: [ReservationProtocol],
                            ownerViewController: UIViewController) -> UITableViewCell {
        let reservation = reservations[indexPath.row]
        let type = reservation.type
        switch type {
        case .e_bike:
            return getEbikeTypeCell(tableView: tableView, indexPath: indexPath, reservation: reservation)
        case .shuttle:
            return getShuttleTypeCell(tableView: tableView, indexPath: indexPath, reservation: reservation)
        case .public_transport:
            return getPublicTransportTypeCell(tableView: tableView, indexPath: indexPath, reservation: reservation)
        }
    }
    
    private func getEbikeTypeCell(tableView: UITableView, indexPath: IndexPath, reservation: ReservationProtocol) -> UITableViewCell {
        guard let ebikeReservation = reservation as? Ebike, let cell = tableView.dequeueReusableCell(withIdentifier: ebikeTypeTableViewCellId, for: indexPath) as? EbikeTypeTableViewCell else { return UITableViewCell()}
        let model = EbikeTypeTableViewCellModel(ebike: ebikeReservation)
        cell.setupCell(model: model)
        
        return cell
    }
    
    private func getShuttleTypeCell(tableView: UITableView, indexPath: IndexPath, reservation: ReservationProtocol) -> UITableViewCell {
        guard let shuttleReservation = reservation as? Shuttle, let cell = tableView.dequeueReusableCell(withIdentifier: shuttleTypeTableViewCellId, for: indexPath) as? ShuttleTypeTableViewCell else { return UITableViewCell()}
        let model = ShuttleTypeTableViewCellModel(shuttle: shuttleReservation)
        cell.setupCell(model: model)
        
        return cell
    }
    
    private func getPublicTransportTypeCell(tableView: UITableView, indexPath: IndexPath, reservation: ReservationProtocol) -> UITableViewCell {
        guard let publicTransportReservation = reservation as? PublicTransport, let cell = tableView.dequeueReusableCell(withIdentifier: publicTransportTypeTableViewCellId, for: indexPath) as? PublicTransportTypeTableViewCell else { return UITableViewCell()}
        let model = PublicTransportTypeTableViewCellModel(publicTransport: publicTransportReservation)
        cell.setupCell(model: model)
        
        return cell
    }
}
