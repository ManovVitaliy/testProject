//
//  ReservationsListViewController.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

protocol ReservationsListViewControllerProtocol: class {
    func typesWereGotten(types: [ReserevationTypeEntity])
    func needUpdateTableViewWith(reservations: [ReservationProtocol])
    func updateFilteredReservations(reservations: [ReservationProtocol])
}

class ReservationsListViewController: BaseViewController {
    //MARK: - outlets
    @IBOutlet weak var reservationsTableView: UITableView!
    @IBOutlet weak var reservationsTypeCollectionView: UICollectionView!
    
    //MARK: - properties
    weak var presenter: ReservationsListPresenterProtocol?
    let tableViewFactory = ReservationsListTableViewFactory()
    let collectionViewFactory = ReservationsTypeCollectionViewFactory()
    var reservations = [ReservationProtocol]()
    var currentReservations = [ReservationProtocol]()
    var reservationTypes = [ReserevationTypeEntity]()
    
    //MARK: - viewcontroller's lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Reservations"
        setupCollectionView()
        setupTableView()
        presenter?.getReservationTypes()
        presenter?.getReservations()
    }
    
    //MARK: - appearance
}

extension ReservationsListViewController: ReservationsListViewControllerProtocol {
    func typesWereGotten(types: [ReserevationTypeEntity]) {
        self.reservationTypes = types
        reloadCollectionView()
    }
    
    func needUpdateTableViewWith(reservations: [ReservationProtocol]) {
        self.reservations = reservations
        self.currentReservations = reservations
        reloadTableView()
    }
    func updateFilteredReservations(reservations: [ReservationProtocol]) {
        self.currentReservations = reservations
        reloadCollectionView()
        reloadTableView()
    }
}

extension ReservationsListViewController {
    //MARK: - private methods
    private func setupTableView() {
        tableViewFactory.registerCellsAndSetupSettings(tableView: reservationsTableView,
                                                       ownerController: self)
    }
    
    private func setupCollectionView() {
        collectionViewFactory.registerCellsAndSetupSettings(collectionView: reservationsTypeCollectionView,
                                                            ownerController: self)
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.reservationsTableView.reloadData()
        }
    }
    
    private func reloadCollectionView() {
        DispatchQueue.main.async { [weak self] in
            self?.reservationsTypeCollectionView.reloadData()
        }
    }
}

extension ReservationsListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let reservation = currentReservations[indexPath.row]
        return tableViewFactory.returnHeightForRowAt(reservation: reservation)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewFactory.returnNumberOfRowsIn(reservations: currentReservations)
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
                                                       reservations: currentReservations,
                                                       ownerViewController: self)
        
        return cell
    }
}

extension ReservationsListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewFactory.returnNumberOfItemsInSection(reservationTypes: reservationTypes)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionViewFactory.returnCellForItemAt(indexPath: indexPath,
                                                         collectionView: collectionView,
                                                         reservationTypes: reservationTypes)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = reservationsTypeCollectionView.bounds.size.height
        let width = (reservationsTypeCollectionView.bounds.size.width - 1) / CGFloat(reservationTypes.count)
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedType = reservationTypes[indexPath.item]
        guard selectedType.isSelected == false else { return }
        reservationTypes.forEach { (type) in
            type.isSelected = false
        }
        reservationTypes[indexPath.item].isSelected = true
        let type = reservationTypes[indexPath.item].type
        presenter?.getReservationsWith(type: type, allReservations: reservations)
    }
}
