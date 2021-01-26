//
//  AlertViewController.swift
//  GitHubFollowers
//
//  Created by Roman Khodukin on 1/25/21.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private let containerView = UIView()
    private let titleLabel = GHFTitleLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel = GHFBodyLabel(textAlignment: .center)
    private var iconView = ErrorIconView()
    private let dismissButton = GHFButton(backgroundColor: .red, title: "Хорошо")
    
    private var alertTitle: String?
    private var message: String?
    private var buttonTitle: String?
    
    private let inset: CGFloat = 16
    
    // MARK: - Initializers
    
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        setupUI()
        configureIconView()
        configureConstraints()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
         
        titleLabel.text = alertTitle ?? "Что-то пошло не так"
        messageLabel.text = message ?? "Не удалось выполнить запрос"
        messageLabel.numberOfLines = 4
        dismissButton.setTitle(buttonTitle ?? "Хорошо", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissAlertVC), for: .touchUpInside)
    }
    
    private func configureIconView() {
        iconView.alpha = 0
        iconView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        UIView.animate(withDuration: 0.2, animations: {
            self.iconView.alpha = 1
            self.iconView.transform = CGAffineTransform.identity
        }, completion: { _ in
            self.iconView.animate()
        })
    }
    
    private func configureConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(iconView)
        containerView.addSubview(dismissButton)
        containerView.addSubview(messageLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.widthAnchor.constraint(equalToConstant: 280),
            containerView.heightAnchor.constraint(equalToConstant: 240),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: inset),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: inset),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -inset),
            titleLabel.heightAnchor.constraint(equalToConstant: inset * 2),
            
            dismissButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -inset),
            dismissButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: inset),
            dismissButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -inset),
            dismissButton.heightAnchor.constraint(equalToConstant: inset * 3),
            
            iconView.bottomAnchor.constraint(equalTo: dismissButton.topAnchor, constant: -inset),
            iconView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconView.heightAnchor.constraint(equalToConstant: inset * 2),
            iconView.widthAnchor.constraint(equalToConstant: inset * 2),
            
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: inset),
            messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -inset),
            messageLabel.bottomAnchor.constraint(equalTo: iconView.topAnchor, constant: -inset)
        ])
    }
    
    @objc private func dismissAlertVC() {
        dismiss(animated: true)
    }
}
