//
//  GFAvatarImageView.swift
//  GHFollowers
//
//  Created by Ezra Black on 11/30/20.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
//    func tamic(_ view: UIView) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//    }
    let cache = NetworkManager.shared.cache
    let placeholderImage = UIImage(named: "avatar-placeholder")!

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds      = true
        image              = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
}
