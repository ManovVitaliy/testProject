//
//  ReserevationTypeEntity.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import Foundation

enum ReservationType: String {
    case all = "All"
    case ebike = "Ebike"
    case publicTransport = "Public"
    case shuttle = "Shuttle"
}

class ReserevationTypeEntity {
    var type: ReservationType = .all
    var isSelected: Bool = false
}
