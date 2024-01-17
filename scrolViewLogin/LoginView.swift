//
//  LoginView.swift
//  scrolViewLogin
//
//  Created by Aleksandr  on 16.01.2024.
//

import UIKit

class ViewLogin: UIView {
    
    private var nameLabelApp: UILabel = {
        let label = UILabel()
        label.text = "Application"
        label.font = UIFont.systemFont(ofSize: 29)
        label.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont.systemFont(ofSize: 21)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите login"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите пароль"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var openButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Вход", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.layer.cornerRadius = 11
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabelApp)
        addSubview(loginLabel)
        addSubview(passwordLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(openButton)
        openButton.addTarget(self, action: #selector(openTapButton), for: .touchUpInside)
        openButton.addTarget(self, action: #selector(openTapedButton), for: .touchDown)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func openTapedButton() {
        UIView.animate(withDuration: 0.5, animations: {
            self.openButton.frame.origin.y -= 21
        }, completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.openButton.frame.origin.y += 77
            }
        })
    }
    
    @objc func openTapButton() {
        guard let login = loginTextField.text,
              let password = passwordTextField.text
        else {return}
        
        if login == "Login",
           password == "1234" {
            print("good")
        } else {
            print("Не правильный логин или пароль")
        }
    }
}

extension ViewLogin {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            //            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            //            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            //            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            //            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),
            //
            
            nameLabelApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            nameLabelApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: nameLabelApp.bottomAnchor, constant: 100),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 15),
            passwordLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            openButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 55),
            openButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            openButton.heightAnchor.constraint(equalToConstant: 50),
            openButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

