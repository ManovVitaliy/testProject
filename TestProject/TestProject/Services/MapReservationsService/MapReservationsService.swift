//
//  MapReservationsService.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

class MapReservationsService {
    func getReservationsFrom(resourceName: String, resourceExtension: String) -> [ReservationProtocol]? {
        if let path = Bundle.main.path(forResource: resourceName, ofType: resourceExtension) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let decoder = JSONDecoder()
                let responseModel = try decoder.decode([AnyTransport].self, from: data)
                var destinationArray = [ReservationProtocol]()
                for anyTransport in responseModel {
                    if let destinationEntity = anyTransport.base {
                        destinationArray.append(destinationEntity)
                    }
                }
                return destinationArray
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        }
        
        return nil
    }
}
