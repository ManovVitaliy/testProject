//
//  PublicTransportTypeTableViewCellModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

class PublicTransportTypeTableViewCellModel {
    var type: String?
    var classLevel: String = ""
    var lineIdentifier: String = ""
    var fromTo: String?
    var hasRestaurantImageString: String
    
    init(publicTransport: PublicTransport) {
        if let t = publicTransport.vehicle?.type {
            type = t.capitalized
            if let subType = publicTransport.vehicle?.train_type {
                type?.append("(\(subType))")
            }
        }
        if let c = publicTransport.travel_class {
            classLevel = "Class: \(c)"
        }
        if let line = publicTransport.line_identifier {
            lineIdentifier = "Line: \(line)"
        }
        hasRestaurantImageString = publicTransport.vehicle?.restaurant == true ? "Restaurant" : ""
        fromTo = getFromTo(publicTransport: publicTransport)
    }
    
    private func getFromTo(publicTransport: PublicTransport) -> String {
        guard let from = publicTransport.from, let to = publicTransport.to else { return "" }
        let dateService = DateService()
        return dateService.getFromToReadableString(from: from, to: to, initialDateFormatType: .yearMonthDayShort, destinationFormatType: .monthDayYearReadable)
    }
}
