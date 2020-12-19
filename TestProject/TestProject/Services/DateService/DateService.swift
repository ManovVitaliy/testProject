//
//  DateService.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import UIKit

class DateService {
    func getFromToReadableString(from: String, to: String, initialDateFormatType: DateFormatType, destinationFormatType: DateFormatType) -> String {
        let fromDate = from.toDate(withFormat: initialDateFormatType.rawValue)
        let fromReadable = fromDate.toStringWith(formatType: destinationFormatType)
        let toDate = to.toDate()
        let toReadable = toDate.toStringWith(formatType: destinationFormatType)
        let finalString = "From" + " " + fromReadable + " " + "to" + " " + toReadable
        
        return finalString
    }
}
