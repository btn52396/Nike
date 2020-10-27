//
//  AlbumDetailsView.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/27/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class AlbumDetailsView: UIView {
    
    weak var delegate: AlbumDetailsViewDelegate?
    
    var albumImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .secondaryBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var albumLabel: UILabel = {
        let label = UILabel()
        label.font = .detailsTitle
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var artistLabel = subtitleLabel()
    var genreLabel: UILabel = subtitleLabel()
    var releaseDateLabel: UILabel = bodyLabel()
    var copyrightLabel: UILabel = bodyLabel()
    
    static private func subtitleLabel() -> UILabel {
        let label = UILabel()
        label.font = .detailsSubtitle
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static private func bodyLabel() -> UILabel {
        let label = UILabel()
        label.font = .detailsBody
        label.textColor = .label
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
            
    lazy var visitAlbumButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Visit Album", for: .normal)
        button.backgroundColor = .buttonBackground
        button.tintColor = .buttonTitle
        button.titleLabel?.font = .button
        button.layer.cornerRadius = .buttonRadius
        button.layer.masksToBounds = true
        button.addTarget(delegate, action: #selector(delegate?.handleVisitAlbum), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(albumImageView)
        addSubview(albumLabel)
        addSubview(artistLabel)
        addSubview(genreLabel)
        addSubview(releaseDateLabel)
        addSubview(copyrightLabel)
        addSubview(visitAlbumButton)

        setupAlbumImageView()
        setupAlbumLabel()
        setupArtistLabel()
        setupGenreLabel()
        setupReleaseDateLabel()
        setupCopyrightLabel()
        setupVisitAlbumButton()
    }
        
    private func setupAlbumImageView() {
        albumImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: topAnchor, constant: .detailsSpacing).isActive = true
        albumImageView.heightAnchor.constraint(equalToConstant: .primaryAlbumLength).isActive = true
        albumImageView.widthAnchor.constraint(equalToConstant: .primaryAlbumLength).isActive = true
    }
    
    private func setupAlbumLabel() {
        albumLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 30).isActive = true
        albumLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .detailsSpacing).isActive = true
        albumLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .detailsSpacing * -1).isActive = true
    }
    
    private func setupArtistLabel() {
        artistLabel.topAnchor.constraint(equalTo: albumLabel.bottomAnchor, constant: .detailsLabelSpacing).isActive = true
        artistLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .detailsSpacing).isActive = true
        artistLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .detailsSpacing * -1).isActive = true
    }
    
    private func setupGenreLabel() {
        genreLabel.topAnchor.constraint(equalTo: artistLabel.bottomAnchor, constant: .detailsLabelSpacing).isActive = true
        genreLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .detailsSpacing).isActive = true
        genreLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .detailsSpacing * -1).isActive = true
    }
    
    private func setupReleaseDateLabel() {
        releaseDateLabel.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 20).isActive = true
        releaseDateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .detailsSpacing).isActive = true
        releaseDateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .detailsSpacing * -1).isActive = true
    }
    
    private func setupCopyrightLabel() {
        copyrightLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: .detailsLabelSpacing).isActive = true
        copyrightLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: .detailsSpacing).isActive = true
        copyrightLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: .detailsSpacing * -1).isActive = true
    }
    
    private func setupVisitAlbumButton() {
        visitAlbumButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .buttonSpacing * -1).isActive = true
        visitAlbumButton.leftAnchor.constraint(equalTo: leftAnchor, constant: .buttonSpacing).isActive = true
        visitAlbumButton.rightAnchor.constraint(equalTo: rightAnchor, constant: .buttonSpacing * -1).isActive = true
        visitAlbumButton.heightAnchor.constraint(equalToConstant: .buttonHeight).isActive = true
    }
}

@objc protocol AlbumDetailsViewDelegate: class {
    
    @objc func handleVisitAlbum()
}
