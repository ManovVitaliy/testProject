//
//  Ebike.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

struct Ebike: Codable, ReservationProtocol {
    var type = TransportType.e_bike
    var vehicle: EbikeVehicle?
    var from: String?
    var to: String?
}
