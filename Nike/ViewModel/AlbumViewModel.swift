//
//  AlbumViewModel.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/26/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class AlbumViewModel {
    
    let album: Album
    let itunesLink: String
    var albumImage: UIImage?
    
    init(album: Album) {
        self.album = album
        
        let itunesPrefix = "itms://itunes.apple.com/"
        let url = URL(string: album.url)
        let itunesSuffix = url?.pathComponents.dropFirst().joined(separator: "/") ?? ""
        self.itunesLink = itunesPrefix + itunesSuffix
    }
    
    /// Configures a cell
    public func configure(cell: AlbumCell) {
        cell.albumLabel.text = album.name
        cell.artistLabel.text = album.artistName
        cell.albumImageView.image = nil
        
        if let albumImage = albumImage {
            cell.albumImageView.image = albumImage
        } else {
            self.fetchImage{
                // It may take awhile for the image fetch to complete. During this
                // time, the user may have scrolled away causing the cell to be
                // reused for another row. We need to make sure the cell has not
                // been reused before setting the image.
                if cell.albumLabel.text == self.album.name {
                    cell.albumImageView.image = self.albumImage
                }
            }
        }
    }
    
    /// Configures a view
    public func configure(view: AlbumDetailsView) {
        view.albumLabel.text = album.name
        view.artistLabel.text = album.artistName
        view.releaseDateLabel.text = "Released " + album.releaseDate.format(withFormat: "MMM d, yyyy")
        view.copyrightLabel.text = album.copyright
        view.genreLabel.text = album.genres.first?.name
        
        if let albumImage = albumImage {
            view.albumImageView.image = albumImage
        } else {
            self.fetchImage {
                view.albumImageView.image = self.albumImage
            }
        }
    }
    
    private func fetchImage(completionHandler: @escaping () -> ()) {
        NikeClient.shared.fetchImage(link: album.artworkUrl100) { (image) in
            self.albumImage = image
            
            DispatchQueue.main.async {
                completionHandler()
            }
        }
    }
}
