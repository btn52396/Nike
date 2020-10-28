//
//  Response.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation

// MARK: - Response

struct Response: Codable {
    
    let feed: Feed
}

// MARK: - Feed

struct Feed: Codable {
    
    let title: String
    let id: String
    let author: Author
    let links: [Link]
    let copyright: String
    let country: String
    let icon: String
    let updated: String
    let albums: [Album]
    
    enum CodingKeys: String, CodingKey {
        case title, id, author, links, copyright, country, icon, updated
        case albums = "results"
    }
}

// MARK: - Author

struct Author: Codable {
    
    let name: String
    let uri: String
}

// MARK: - Link
struct Link: Codable {
    
    let linkSelf: String?
    let alternate: String?
    
    enum CodingKeys: String, CodingKey {
        case alternate
        case linkSelf = "self"
    }
}

// MARK: - Album

struct Album: Codable {
    
    let artistName: String
    let id: String
    let releaseDate: String
    let name: String
    let kind: String
    let copyright: String
    let artistId: String
    let contentAdvisoryRating: ContentAdvisoryRating?
    let artistUrl: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    
    enum ContentAdvisoryRating: String, Codable {
        case explicit = "Explicit"
    }
}

// MARK: - Genre

struct Genre: Codable {
    
    let genreId: String
    let name: String
    let url: String
}
