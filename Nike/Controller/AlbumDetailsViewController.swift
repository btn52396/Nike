//
//  AlbumDetailsViewController.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/25/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class AlbumDetailsViewController: UIViewController {
    var albumViewModel: AlbumViewModel? = nil
    
    var albumDetailsView: AlbumDetailsView = {
        let albumDetailsView = AlbumDetailsView()
        albumDetailsView.translatesAutoresizingMaskIntoConstraints = false
        return albumDetailsView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        if !UIDevice.current.isSimulator {
            
        } else {
            // Ensure that the user is not on a simulator
//            showAlert(title: "Error", message: "Application can only open the iTunes store with a real device.")
        }
    }
        
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
