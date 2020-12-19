//
//  EbikeTypeTableViewCellModel.swift
//  TestProject
//
//  Created by user on 19.12.2020.
//

import Foundation

class EbikeTypeTableViewCellModel {
    var type: String = ""
    var tagString: String = ""
    var size: String = ""
    var fromTo: String = ""
    
    init(ebike: Ebike) {
        type = ebike.vehicle?.getReadableType() ?? ""
        if let tag = ebike.vehicle?.tag {
            tagString = "Tag: " + String(tag)
        }
        if let s = ebike.vehicle?.size {
            size = "Size: " + s
        }
        fromTo = getFromTo(ebike: ebike)
    }
    
    private func getFromTo(ebike: Ebike) -> String {
        guard let from = ebike.from, let to = ebike.to else { return "" }
        let dateService = DateService()
        return dateService.getFromToReadableString(from: from, to: to, initialDateFormatType: .yearMonthDayShort, destinationFormatType: .monthDayYearReadable)
    }
}
