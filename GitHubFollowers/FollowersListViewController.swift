//
//  FollowersListViewController.swift
//  GitHubFollowers
//
//  Created by Roman Khodukin on 1/23/21.
//

import UIKit

class FollowersListViewController: UIViewController {

    // MARK: - Public Properties
    
    var username: String!
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    // MARK: - Private methods
    
    
}
