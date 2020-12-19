//
//  Shuttle.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

struct Shuttle: Codable, ReservationProtocol {
    var type = TransportType.shuttle
    var vehicle: ShuttleVehicle?
    var line_color: String?
    var line_identifier: String?
    var from: String?
    var to: String?
}
