//
//  GFItemInfoViewController.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/3/20.
//

import UIKit

class GFItemInfoViewController: UIViewController {
    let stackView       = UIStackView()
    let itemInfoViewOne = GFItemInfoView()
    let itemInfoViewTwo = GFItemInfoView()
    let actionButton    = GFButton()
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureStackView()
        configureBackroundView()
    }
    
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   private func configureBackroundView() {
        view.layer.cornerRadius     =  18
        view.backgroundColor        = .secondarySystemBackground
    }
    
    
    private func configureStackView() {
        stackView.axis              = .horizontal
        stackView.distribution      = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoViewOne)
        stackView.addArrangedSubview(itemInfoViewTwo)
    }
    
    
   private func layoutUI() {
    view.addSubview(stackView)
    view.addSubview(actionButton)
    
    let padding: CGFloat = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        stackView.heightAnchor.constraint(equalToConstant: 50),
        
        actionButton.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor, constant: -padding),
        actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
        actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        actionButton.heightAnchor.constraint(equalToConstant: 44)
    ])
    }
}
