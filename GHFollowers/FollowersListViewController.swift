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
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Ope! Bad stuff happened.", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            
            print("followers.count = \(followers.count)")
            print(followers)
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
}
