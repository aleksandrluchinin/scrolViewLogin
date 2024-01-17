//
//  LoginViewController.swift
//  scrolViewLogin
//
//  Created by Aleksandr  on 16.01.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private var loginscrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.addSubview(loginscrollView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidshow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(onTap))
        recognizer.cancelsTouchesInView = false
         self.view.addGestureRecognizer(recognizer)
        
        NSLayoutConstraint.activate([
            loginscrollView.topAnchor.constraint(equalTo: view.topAnchor),
            loginscrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginscrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginscrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        let contentView = ViewLogin()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        loginscrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: loginscrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: loginscrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: loginscrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: loginscrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: loginscrollView.widthAnchor)
        ])
        
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: loginscrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
    }
    
    @objc func keyboardDidshow(_ notification: Notification) {
        guard let keybordHeight = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue)?.height else
           { return }
        
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: keybordHeight + 20, right: 0)
        
        loginscrollView.contentInset = insets
        loginscrollView.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardDidHide() {
        loginscrollView.contentInset = UIEdgeInsets.zero
        loginscrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        
    }
deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onTap() {
        self.view.endEditing(true)
    }
}

  
