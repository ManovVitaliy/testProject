//
//  ShuttleTypeTableViewCellModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import UIKit

class ShuttleTypeTableViewCellModel {
    var type: String = ""
    var availableSeats: String?
    var isSupportWheelchairImageString: String
    var lineColor: UIColor?
    var lineIDString: String?
    var fromTo: String?
    
    init(shuttle: Shuttle) {
        type = shuttle.vehicle?.getReadableType() ?? ""
        let seats: Int = shuttle.vehicle?.available_seats ?? 0
        availableSeats = "Available seats: \(seats)"
        isSupportWheelchairImageString = shuttle.vehicle?.wheelchair_loading ==  true ? "WheelChair" : ""
        if let hex = shuttle.line_color {
            lineColor = UIColor(hex: hex)
        }
        lineIDString = shuttle.line_identifier
        fromTo = getFromTo(shuttle: shuttle)
    }
    
    private func getFromTo(shuttle: Shuttle) -> String {
        guard let from = shuttle.from, let to = shuttle.to else { return "" }
        let dateService = DateService()
        return dateService.getFromToReadableString(from: from, to: to, initialDateFormatType: .yearMonthDayShort, destinationFormatType: .monthDayYearReadable)
    }
}
