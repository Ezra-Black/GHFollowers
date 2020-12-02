//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/1/20.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }

}
