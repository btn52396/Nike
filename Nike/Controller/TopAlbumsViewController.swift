//
//  TopAlbumsViewController.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class TopAlbumsViewController: UITableViewController, RefreshDelegate {
    
    // MARK: - Variable properties
    
    private let retryViewController = RetryViewController()
    private let spinnerViewController = SpinnerViewController()
    private let cellId = "AlbumCell"
    var albumViewModels: [AlbumViewModel] = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetch()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .primaryBackground
        navigationItem.largeTitleDisplayMode = .always
        title = "Top 100 Albums"
        retryViewController.retryView.delegate = self
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(AlbumCell.self, forCellReuseIdentifier: cellId)
        tableView.accessibilityIdentifier = "TopAlbumsTableView"
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.backgroundView = spinnerViewController.view
    }
    
    /// Calls the network client to fetch the albums.
    /// Present the retry view if the fetch fails - function can be called again from
    /// the retry view. If fetch is successful, generate view models and
    /// reload the tableView and populate it with the album details.
    @objc func fetch() {
        NikeClient.shared.fetchAlbums { (error) in
            if error != nil {
                self.showRetryView()
            } else {
                self.configureViewModels()
                self.reloadData()
            }
        }
    }
    
    /// Configures view models for each album using the models generated from the JSON file
    private func configureViewModels() {
        for album in NikeClient.shared.albums {
            albumViewModels.append(AlbumViewModel(album: album))
        }
    }

    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.backgroundView = nil
            self.tableView.reloadData()
        }
    }
    
    /// Present retry view
    private func showRetryView() {
        DispatchQueue.main.async {
            self.tableView.backgroundView = self.retryViewController.view
        }
    }
}

// MARK: - TableView Properties

extension TopAlbumsViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AlbumCell
        cell.viewModel = albumViewModels[indexPath.row]
        cell.configure()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumDetailsViewController = AlbumDetailsViewController()
        albumDetailsViewController.albumViewModel = albumViewModels[indexPath.row]
        navigationController?.pushViewController(albumDetailsViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModels.count
    }
}

