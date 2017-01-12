//
//  ErrorController.swift
//  CollabChat
//
//  Created by Jeff Norton on 1/11/17.
//  Copyright © 2017 JeffCryst. All rights reserved.
//

import UIKit

class PresentationController {
    
    //==================================================
    // MARK: - Methods
    //==================================================
    
    static func showErrorAlertController(withTitle title: String, andMessage message: String, inViewController viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    static func startActivityIndicatorView(inView view: UIView, withMessage message: String) -> UIView {
        let messageViewHeight: CGFloat = 50.0
        let messageViewWidth: CGFloat = 200.0
        
        let activityLabel = UILabel(frame: CGRect(x: 50
            , y: 0.0
            , width: messageViewWidth
            , height: messageViewHeight))
        activityLabel.text = message
        activityLabel.textColor = ThemeManager.getTheme()?.tintColor        
        let messageFrame = UIView(frame: CGRect(x: (view.frame.midX - (messageViewWidth * 0.5))
            , y: (view.frame.midY - (messageViewHeight * 0.5))
            , width: 180
            , height: 50))
        messageFrame.layer.cornerRadius = 20
        messageFrame.backgroundColor = UIColor.gray
        
        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicatorView.frame = CGRect(x: 0.0
            , y: 0.0
            , width: 50.0
            , height: 50.0)
        activityIndicatorView.startAnimating()
        
        messageFrame.addSubview(activityIndicatorView)
        messageFrame.addSubview(activityLabel)
        view.addSubview(messageFrame)
        
        return messageFrame
    }
    
    static func stopActivityIndicatorView(_ view: UIView) {
        DispatchQueue.main.async {
            view.removeFromSuperview()
        }
    }

}
