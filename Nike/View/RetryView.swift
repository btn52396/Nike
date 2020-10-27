//
//  RetryView.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/26/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class RetryView: UIView {
    
    weak var delegate: RefreshDelegate?
    
    private let title: UILabel = {
        let label = UILabel()
        label.text = "Connect to the Internet"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "You're offline. Check your connection."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var noInternetImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "No-Internet")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .label
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
        
    private lazy var tryAgainbutton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TAP TO RETRY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(delegate, action: #selector(delegate?.fetch), for: .touchUpInside)
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
        addSubview(noInternetImageView)
        addSubview(title)
        addSubview(subtitle)
        addSubview(tryAgainbutton)
        
        setupNoInternetImageView()
        setupTitleLabel()
        setupSubtitle()
        setupTryAgainButton()
    }
    
    private func setupNoInternetImageView() {
        noInternetImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        noInternetImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        noInternetImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        noInternetImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupTitleLabel() {
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.topAnchor.constraint(equalTo: noInternetImageView.bottomAnchor, constant: 20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupSubtitle() {
        subtitle.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20).isActive = true
        subtitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setupTryAgainButton() {
        tryAgainbutton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tryAgainbutton.topAnchor.constraint(equalTo: subtitle.bottomAnchor, constant: 20).isActive = true
        tryAgainbutton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        tryAgainbutton.widthAnchor.constraint(equalToConstant: 140).isActive = true
    }
}

@objc protocol RefreshDelegate: class {
    
    @objc func fetch()
}
