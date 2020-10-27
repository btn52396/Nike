//
//  DateFormatter.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/27/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation

extension String {
    
    /// Formats a 'yyyy-MM-dd' date to a more readable friendly format
    /// - Parameters:
    ///     - withFormat: The format to change the date to
    func format(withFormat format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: self) {
            formatter.dateFormat = format
            return formatter.string(from: date)
        }
        return ""
    }
}
