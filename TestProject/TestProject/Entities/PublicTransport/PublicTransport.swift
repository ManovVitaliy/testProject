//
//  PublicTransport.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

struct PublicTransport: Codable, ReservationProtocol {
    var type = TransportType.public_transport
    var vehicle: PublicTransportVehicle?
    var line_identifier: String?
    var travel_class: String?
    var from: String?
    var to: String?
}
