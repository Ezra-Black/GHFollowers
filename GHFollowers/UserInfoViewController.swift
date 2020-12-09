//
//  UserInfoViewController.swift
//  GHFollowers
//
//  Created by Ezra Black on 12/1/20.
//

import UIKit

protocol UserInfoViewControllerDelegate: class {
    func didRequestFollowers(for username: String)
}

class UserInfoViewController: UIViewController {
    let headerView          = UIView()
    let itemViewOne         = UIView()
    let itemViewTwo         = UIView()
    let dateLabel           = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    var username: String!
    weak var delegate: UserInfoViewControllerDelegate!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    
    func configureViewController() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissViewController))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElementsWithUser(user: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
                break
            }
        }
    }
    
    
    func configureUIElementsWithUser(user: User) {
        self.add(childVC: GFUserInfoHeaderViewController(user: user), to: self.headerView)
        self.add(childVC: GFRepoItemViewController(user: user, delegate: self), to: self.itemViewOne)
        self.add(childVC: GFFollowerItemViewController(user: user, delegate: self), to: self.itemViewTwo)
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    
    func layoutUI() {
        let padding: CGFloat        = 20
        let itemHeight: CGFloat     = 140
        
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        
        for i in itemViews {
            view.addSubview(i)
            i.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                i.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                i.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            ])
        }
                
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 210),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
            
            dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: padding),
            dateLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    
    @objc func dismissViewController() {
        dismiss(animated: true)
    }
}

extension UserInfoViewController: GFRepoItemVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else { presentGFAlertOnMainThread(title: "Invalid URL",
                                                                                    message: "The message attached to this user is invalid",
                                                                                    buttonTitle: "Ok")
            return
        }
        presentSafariViewController(with: url)
    }
}

extension UserInfoViewController: GFFollowerVCDelegate {
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No followers", message: "This user has no followers, what a shame 🥺", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissViewController()
    }
}

