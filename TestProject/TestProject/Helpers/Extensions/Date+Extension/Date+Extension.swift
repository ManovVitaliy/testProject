//
//  Date+Extension.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import Foundation

enum DateFormatType: String {
    case monthDayYearReadable = "dd MMM, yyyy"
    case yearMonthDayShort = "yyyy-MM-dd"
}

extension Date {
    func toStringWith(formatType: DateFormatType) -> String {
        let formatterForServer = DateFormatter()
        formatterForServer.dateFormat = formatType.rawValue
        return formatterForServer.string(from: self)
    }
}
