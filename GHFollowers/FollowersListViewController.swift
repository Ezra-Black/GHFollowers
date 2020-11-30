//
//  FollowersListViewController.swift
//  GHFollowers
//
//  Created by Ezra Black on 11/30/20.
//

import UIKit

class FollowersListViewController: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tertiaryLabel
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
