//
//  NikeClient.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation
import UIKit

class NikeClient {
    
    static let shared = NikeClient()
    public var albums: [Album] = []
    
    private init() {}
    
    /// Fetches an image from network
    /// - Parameters:
    ///     - link: A string with an address used to create a url
    ///     - completionHandler: completes with an image fetched from network
    public func fetchImage(link: String, completionHandler: @escaping (UIImage) -> ()) {
        guard let url = URL(string: link) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
                completionHandler(image)
        }.resume()
    }
    
    /// Fetchs json feed from network and creates Album objects
    /// - Parameters:
    ///     - completionHandler: completes with an error if operation failed
    public func fetchAlbums(completionHandler: @escaping (Error?) -> ()) {
        if let url = URL.topAlbums {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        let result = try JSONDecoder().decode(Response.self, from: data)
                        self.albums = result.feed.albums
                        completionHandler(nil)
                    } catch let error {
                        print("Error: \(error)")
                        completionHandler(error)
                    }
                } else {
                    print("Error: \(String(describing: error))")
                    completionHandler(error)
                }
            }.resume()
        }
    }
}
