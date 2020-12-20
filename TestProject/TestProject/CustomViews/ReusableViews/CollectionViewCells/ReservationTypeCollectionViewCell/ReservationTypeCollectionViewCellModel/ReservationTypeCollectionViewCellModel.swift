//
//  ReservationTypeCollectionViewCellModel.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import UIKit

class ReservationTypeCollectionViewCellModel {
    var backgroundColor: UIColor
    var textColor: UIColor
    var typeName: String = ""
    
    init(reservationTypeEntity: ReserevationTypeEntity) {
        self.backgroundColor = reservationTypeEntity.isSelected ? .blue : .white
        self.textColor = reservationTypeEntity.isSelected ? .white : .blue
        self.typeName = reservationTypeEntity.type.rawValue
    }
}
