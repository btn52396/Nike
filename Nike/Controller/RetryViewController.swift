//
//  RetryViewController.swift
//  Nike
//
//  Created by Bryan Nguyen on 10/26/20.
//  Copyright © 2020 Bryan Nguyen. All rights reserved.
//

import UIKit

class RetryViewController: UIViewController {
        
    var retryView = RetryView()

    // MARK: - Lifecycle
    
    override func loadView() {
        view = UIView()
        
        retryView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(retryView)

        retryView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        retryView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        retryView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        retryView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}
