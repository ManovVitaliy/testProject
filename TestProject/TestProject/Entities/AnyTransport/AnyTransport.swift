//
//  AnyTransport.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

struct AnyTransport: Codable {
    var type = TransportType.public_transport
    var base: ReservationProtocol?
    
    private enum CodingKeys : CodingKey {
        case type, base
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let type = try container.decode(TransportType.self, forKey: .type)
        self.base = try type.metatype.init(from: decoder)//try type.metatype.init(from: container.superDecoder(forKey: .base))
    }

    func encode(to encoder: Encoder) throws {

    }
}
