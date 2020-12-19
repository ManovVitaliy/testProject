//
//  String+Extension.swift
//  TestProject
//
//  Created by user on 20.12.2020.
//

import Foundation

extension String {
    func toDate(withFormat format: String = DateFormatType.yearMonthDayShort.rawValue) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        guard let date = dateFormatter.date(from: self) else {
            preconditionFailure("Take a look to your format")
        }
        return date
    }
}
