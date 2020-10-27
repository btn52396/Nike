//
//  Fonts.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/26/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

// MARK: - Font

extension UIFont {

    /// Package title label font
    public static var title: UIFont = UIFont(
        name: .graphikMedium,
        size: 14) ?? .systemFont(ofSize: 14)

    /// Package description label & package accessories label & price title label
    public static var body: UIFont = UIFont(
        name: .graphikMedium,
        size: 11) ?? .systemFont(ofSize: 11)

    /// Price label font
    public static var price: UIFont = UIFont(
        name: .graphikMedium,
        size: 26) ?? .systemFont(ofSize: 26)

    /// Button font
    public static var button: UIFont = UIFont(
        name: .graphikMedium,
        size: 16) ?? .systemFont(ofSize: 16)
}

// MARK: - Font names

extension String {

    fileprivate static let graphikMedium: String = "Graphik-Medium"
    fileprivate static let graphikRegular: String = "Graphik-Regular"
    fileprivate static let groteskSquare: String = "NewGroteskSquareFOUR"
}
