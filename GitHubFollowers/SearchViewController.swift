//
//  SearchViewController.swift
//  GitHubFollowers
//
//  Created by Roman Khodukin on 1/22/21.
//

import UIKit

class SearchViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let logoImageView = UIImageView()
    private let userNameTextField = GHFTextField()
    private let searchButton = GHFButton(backgroundColor: .systemGreen, title: "Искать")
    
    var isUsernameFilled: Bool {
        return !userNameTextField.text!.isEmpty
    }
    
    // MARK: - LifeCycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupViews()
        setupDismissKeyboard()
    }
    
    // MARK: - Public Methods
    
    
    
    // MARK: - Private Methods
    
    private func setupViews() {
        logoImageView.image = .logo
        userNameTextField.delegate = self
        searchButton.addTarget(self, action: #selector(pushFollowersListVC), for: .touchUpInside)
        
        view.addSubview(logoImageView)
        view.addSubview(userNameTextField)
        view.addSubview(searchButton)
        
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 192),
            logoImageView.widthAnchor.constraint(equalToConstant: 192),
            
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 64),
            userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            userNameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            searchButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func setupDismissKeyboard() {
        let tap = UIGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowersListVC() {
        guard isUsernameFilled else {
            presentAlertOnMainTread(title: "Пустое имя пользователя", message: "Пожалуйста, введите имя пользователя.", buttonTitle: "Хорошо")
            return
        }
        let followersListVC = FollowersListViewController()
        followersListVC.username = userNameTextField.text
        followersListVC.title = userNameTextField.text
        navigationController?.pushViewController(followersListVC, animated: true)
    }
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersListVC()
        return true
    }
}
