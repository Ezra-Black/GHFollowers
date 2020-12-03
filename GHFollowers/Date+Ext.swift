//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/3/20.
//

import Foundation

extension Date {
    
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
