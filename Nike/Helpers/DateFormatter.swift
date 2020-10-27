//
//  DateFormatter.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/27/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation

extension String {
    
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
