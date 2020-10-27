//
//  URL.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation

// MARK: - URL

extension URL {
    
    /// Feed URL of top 100 albums across all genres
    public static var topAlbums: URL? = URL(string: .topAlbums) 
}

// MARK: - URL Strings

extension String {
    
    fileprivate static let topAlbums: String = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json"
}
