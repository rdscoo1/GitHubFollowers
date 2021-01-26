//
//  UIViewController+Ext.swift
//  GitHubFollowers
//
//  Created by Roman Khodukin on 1/25/21.
//

import UIKit

extension UIViewController {

    func presentAlertOnMainTread(title: String, message: String, buttonTitle: String) {
        let generator = UINotificationFeedbackGenerator()
        DispatchQueue.main.async {
            generator.notificationOccurred(UINotificationFeedbackGenerator.FeedbackType.warning)
            let alertVC = AlertViewController(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
