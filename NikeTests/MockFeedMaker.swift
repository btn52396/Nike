//
//  MockFeedMaker.swift
//  NikeTests
//
//  Created by Bryan Nguyen on 10/27/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import Foundation
import XCTest
@testable import Nike

/// Generates data and view models from local mock JSON  to be used for tests
class MockFeedMaker {
    
    static let shared = MockFeedMaker()
    
    let data: Data
    let albumViewModels: [AlbumViewModel]

    init(data: Data, albumViewModels: [AlbumViewModel]) {
        self.data = data
        self.albumViewModels = albumViewModels
    }
    
    convenience init() {
        do {
            let url = try XCTUnwrap(
                Bundle(for: NikeTests.self).url(forResource: "MockFeed", withExtension: "json")
            )
            let data = try Data(contentsOf: url)
            let response = try NikeClient.decode(data: data)
            let albums = response.feed.albums
            var albumViewModels: [AlbumViewModel] = []
            
            for album in albums {
                albumViewModels.append(AlbumViewModel(album: album))
            }

            self.init(data: data, albumViewModels: albumViewModels)
        } catch {
            self.init(data: Data(), albumViewModels: [])
        }
    }
}
