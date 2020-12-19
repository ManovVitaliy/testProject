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
    @IBOutlet weak var reservationsTableView: UITableView!
    
    //MARK: - properties
    weak var presenter: ReservationsListPresenterProtocol?
    let tableViewFactory = ReservationsListTableViewFactory()
    var reservations = [ReservationProtocol]()
    
    //MARK: - viewcontroller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservations"
        setupTableView()
        presenter?.getReservations()
    }
    
    //MARK: - appearance
}

extension ReservationsListViewController: ReservationsListViewControllerProtocol {
    func needUpdateTableViewWith(reservations: [ReservationProtocol]) {
        self.reservations = reservations
        reloadTableView()
    }
}

extension ReservationsListViewController {
    //MARK: - private methods
    private func setupTableView() {
        tableViewFactory.registerCellsAndSetupSettings(tableView: reservationsTableView,
                                                       ownerController: self)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.reservationsTableView.reloadData()
        }
    }
}

extension ReservationsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let reservation = reservations[indexPath.row]
        return tableViewFactory.returnHeightForRowAt(reservation: reservation)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewFactory.returnNumberOfRowsIn(reservations: reservations)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return tableViewFactory.returnViewForFooterInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewFactory.returnCellForRowAt(indexPath: indexPath,
                                                       tableView: tableView,
                                                       reservations: reservations,
                                                       ownerViewController: self)
        
        return cell
    }
}
