//
//  AlbumDetailsViewController.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController, AlbumDetailsViewDelegate {
    
    // MARK: - Property variables
    
    var albumViewModel: AlbumViewModel? = nil
    
    var albumDetailsView: AlbumDetailsView = {
        let albumDetailsView = AlbumDetailsView()
        albumDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return albumDetailsView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        albumDetailsView.delegate = self

        setupViews()
    }
    
    // MARK: - Handle delegate
    
    @objc func handleVisitAlbum() {
        guard
            let itunesLink = albumViewModel?.itunesLink,
            let url = URL(string: itunesLink),
            UIApplication.shared.canOpenURL(url) else {
            showAlert(title: "Error", message: "Application can only open the iTunes store with a real device.")
            return
        }
        
        UIApplication.shared.open(url)
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.backgroundColor = .primaryBackground
        title = "Album Details"
            
        view.addSubview(albumDetailsView)
        setupAlbumDetailsView()
    }
    
    private func setupAlbumDetailsView() {
        DispatchQueue.main.async {
            self.albumDetailsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
            self.albumDetailsView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.topbarHeight).isActive = true
            self.albumDetailsView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            self.albumViewModel?.configure(view: self.albumDetailsView)
        }
    }
}
