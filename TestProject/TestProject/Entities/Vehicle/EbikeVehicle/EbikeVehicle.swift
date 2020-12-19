//
//  EbikeVehicle.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

enum EbikeVehicleType: String {
    case foldable_e_bike = "foldable_e_bike"
    case cross_e_bike = "cross_e_bike"
}

struct EbikeVehicle: Codable {
    var type: String?
    var tag: Int?
    var size: String?
    
    func getReadableType() -> String {
        guard let t = type else { return "" }
        switch t {
        case EbikeVehicleType.foldable_e_bike.rawValue:
            return "Foldable eBike"
        case EbikeVehicleType.cross_e_bike.rawValue:
            return "Cross eBike"
        default:
            return ""
        }
    }
}
