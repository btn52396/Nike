//
//  AlbumCell.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/26/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    // MARK: - Property Variables
    
    var viewModel: AlbumViewModel?
    
    var albumImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .secondaryBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var albumLabel: UILabel = {
        let label = UILabel()
        label.font = .previewTitle
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var artistLabel: UILabel = {
        let label = UILabel()
        label.font = .previewBody
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: -  Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addSubview(albumImageView)
        addSubview(artistLabel)
        addSubview(albumLabel)
        
        setupAlbumImageView()
        setupArtistLabel()
        setupAlbumLabel()
    }
    
    public func configure() {
        viewModel?.configure(cell: self)
    }
    
    // MARK: - Constraints
    
    private func setupAlbumImageView() {
        albumImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: .cellSpacing).isActive = true
        albumImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: .previewAlbumLength).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: .previewAlbumLength).isActive = true
    }
    
    private func setupAlbumLabel() {
        albumLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: .cellSpacing).isActive = true
        albumLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .cellSpacing * -1).isActive = true
        albumLabel.bottomAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupArtistLabel() {
        artistLabel.leftAnchor.constraint(equalTo: albumImageView.rightAnchor, constant: .cellSpacing).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .cellSpacing * -1).isActive = true
        artistLabel.topAnchor.constraint(equalTo: centerYAnchor, constant: .textSpacing).isActive = true
    }
}
