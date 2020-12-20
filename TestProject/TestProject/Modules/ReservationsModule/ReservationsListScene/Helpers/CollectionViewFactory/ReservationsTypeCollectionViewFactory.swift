//
//  ReservationsTypeCollectionViewFactory.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import UIKit

class ReservationsTypeCollectionViewFactory {
    //MARK: - constants
    let reservationTypeCollectionViewCellId = "ReservationTypeCollectionViewCell"

    func registerCellsAndSetupSettings(collectionView: UICollectionView, ownerController: UIViewController) {
        collectionView.dataSource = ownerController as? UICollectionViewDataSource
        collectionView.delegate = ownerController as? UICollectionViewDelegate
        collectionView.register(UINib(nibName: reservationTypeCollectionViewCellId, bundle: nil), forCellWithReuseIdentifier: reservationTypeCollectionViewCellId)
        collectionView.bounces = false
    }
    
    func returnNumberOfItemsInSection(reservationTypes: [ReserevationTypeEntity]) -> Int {
        return reservationTypes.count
    }
    
    func returnCellForItemAt(indexPath: IndexPath,
                             collectionView: UICollectionView,
                             reservationTypes: [ReserevationTypeEntity]) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reservationTypeCollectionViewCellId, for: indexPath) as? ReservationTypeCollectionViewCell else { return UICollectionViewCell() }
        let type = reservationTypes[indexPath.item]
        let model = ReservationTypeCollectionViewCellModel(reservationTypeEntity: type)
        cell.setupCell(model: model)
        return cell
    }
}
