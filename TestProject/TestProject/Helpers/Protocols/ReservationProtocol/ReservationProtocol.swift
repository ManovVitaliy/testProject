//
//  ReservationProtocol.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

protocol ReservationProtocol: Codable {
    var type: TransportType { get }
    var from: String? { get set }
    var to: String? { get set }
}

enum TransportType : String, Codable {
    case e_bike, shuttle, public_transport
    
    private enum CodingKeys : CodingKey {
        case type, base
    }

    var metatype: ReservationProtocol.Type {
        switch self {
        case .e_bike:
            return Ebike.self
        case .shuttle:
            return Shuttle.self
        case .public_transport:
            return PublicTransport.self
        }
    }
}
