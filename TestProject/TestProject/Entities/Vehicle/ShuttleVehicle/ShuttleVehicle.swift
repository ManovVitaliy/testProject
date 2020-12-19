//
//  ShuttleVehicle.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

enum ShuttleVehicleType: String {
    case company_shuttle = "company_shuttle"
}

struct ShuttleVehicle: Codable {
    var type: String?
    var available_seats: Int?
    var wheelchair_loading: Bool?
    
    func getReadableType() -> String {
        guard let t = type else { return "" }
        switch t {
        case ShuttleVehicleType.company_shuttle.rawValue:
            return "Company shuttle"
        default:
            return ""
        }
    }
}
