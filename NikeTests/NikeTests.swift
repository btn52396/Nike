//
//  NikeTests.swift
//  NikeTests
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import XCTest
import Foundation
@testable import Nike

class NikeTests: XCTestCase {

    // MARK: - Mock feed
    
    /// Checks mock album is successfully decoded
    func test_decodeMockFeed() {
        let data = MockFeedMaker.shared.data
        XCTAssertNotNil(data)
    }
    
    /// Checks if the count of mock album objects is correct
    func test_countMockFeed() throws {
        let data = MockFeedMaker.shared.data
        let response = try NikeClient.decode(data: data)
        let albums = response.feed.albums
        XCTAssertEqual(albums.count, 100)
    }
    
    /// Checks if first mock album object has correct content
    func test_checkFirstMockAlbumId() throws {
        let data = MockFeedMaker.shared.data
        let response = try NikeClient.decode(data: data)
        let albums = response.feed.albums
        XCTAssertEqual(albums[0].id, "1534209957")
    }
    
    // MARK: - Live feed
    
    /// Checks that network fetch successfully retrieved decodable JSON file
    func test_retrieveLiveFeed() {
        let expectation = XCTestExpectation()
        
        if let url = URL.topAlbums {
            URLSession.shared.dataTask(with: url) { data, response, error in
                XCTAssertNil(error)
                XCTAssertNotNil(data)
                
                expectation.fulfill()
            }.resume()
        }
        wait(for: [expectation], timeout: 15)
    }
    
    /// Check that albums were successfully decoded from JSON network fetch
    func test_decodeLiveFeed() {
        let expectation = XCTestExpectation()
        expectation.fulfill()
        
        if let url = URL.topAlbums {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let _data = data else {
                    XCTAssertNotNil(data)
                    return
                }
                let result = try! NikeClient.decode(data: _data)
                XCTAssertNotNil(result)
            }.resume()
        }
        wait(for: [expectation], timeout: 15)
    }
    
    /// Check that network fetch returns proper number of albums
    func test_countLiveFeed() {
        let expectation = XCTestExpectation()
        expectation.fulfill()
        
        if let url = URL.topAlbums {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let _data = data else {
                    XCTAssertNotNil(data)
                    return
                }
                let result = try! NikeClient.decode(data: _data)
                XCTAssertEqual(result.feed.albums.count, 100)
            }.resume()
        }
        wait(for: [expectation], timeout: 15)
    }
    
    // MARK: - TopAlbumsViewController
    
    /// Checks number of rows in tableView of TopAlbumsViewController
    func test_topAlbumsNumberOfRows() {
        let albumViewModels = MockFeedMaker.shared.albumViewModels
        let topAlbumsViewController = TopAlbumsViewController()
        topAlbumsViewController.albumViewModels = albumViewModels
        topAlbumsViewController.tableView.reloadData()
        
        XCTAssertEqual(topAlbumsViewController.tableView.numberOfRows(inSection: 0), 100)
    }
    
    /// Checks content of first row in tableView of TopAlbumsViewController
    func test_topAlbumsFirstRow() {
        let topAlbumsViewController = TopAlbumsViewController()
        let albumViewModels = MockFeedMaker.shared.albumViewModels
        topAlbumsViewController.albumViewModels = albumViewModels
        topAlbumsViewController.tableView.reloadData()
        let firstCell = topAlbumsViewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AlbumCell
        XCTAssertEqual(firstCell?.albumLabel.text, "SAVAGE MODE II")
        XCTAssertEqual(firstCell?.artistLabel.text, "21 Savage & Metro Boomin")
    }
    
    // MARK: - AlbumDetailsViewController
    
    /// Checks content of AlbumDetailsViewController
    func test_firstAlbumDetailsContent() {
        let albumDetailsViewController = AlbumDetailsViewController()
        albumDetailsViewController.setupViews()
        let albumViewModels = MockFeedMaker.shared.albumViewModels
        albumDetailsViewController.albumViewModel = albumViewModels.first
        let subviews = albumDetailsViewController.view.subviews
        let primarySubview = subviews.first as! AlbumDetailsView
        albumDetailsViewController.albumViewModel?.configure(view: primarySubview)
        
        XCTAssertNotNil(primarySubview)
        XCTAssertEqual(primarySubview.albumLabel.text, "SAVAGE MODE II")
        XCTAssertEqual(primarySubview.artistLabel.text, "21 Savage & Metro Boomin")
        XCTAssertEqual(primarySubview.genreLabel.text, "Hip-Hop/Rap")
        XCTAssertEqual(primarySubview.releaseDateLabel.text, "Released Oct 2, 2020")
        XCTAssertEqual(primarySubview.copyrightLabel.text, "℗ 2020 Slaughter Boomin, LLC under exclusive license to Epic Records. With Boominati Worldwide/Republic Records")
    }
    
    // MARK: - Alert Controller
    
    /// Checks alert controller for error presentation
    func test_alertController() {
        let viewController = AlbumDetailsViewController()
        let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        keyWindow?.rootViewController = viewController
        viewController.showAlert(title: "title", message: "message")
        XCTAssertTrue(viewController.presentedViewController is UIAlertController)
        XCTAssertEqual(viewController.presentedViewController?.title, "title")
    }
    
    // MARK: - Dateformatter
    
    /// Checks that date formatter outputs proper format
    func test_dateFormatter() {
        let inputDate = "2020-10-02"
        let expectedDate = "Oct 2, 2020"
        
        let badInputDate = "asdf"
        let expectedBadDate = ""
        
        XCTAssertEqual(inputDate.format(withFormat: "MMM d, yyyy"), expectedDate)
        XCTAssertEqual(badInputDate.format(withFormat: "MMM d, yyyy"), expectedBadDate)
    }
}
