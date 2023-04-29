//
//  LogInViewController.swift
//  Navigation
//
//  Created by Лена on 4/7/23.
//

import UIKit
import SwiftUI

final class LogInViewController: UIViewController {
    
    private let notification = NotificationCenter.default
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        return contentView
    }()
    
    let imageVK: UIImageView = {
        let imageVK = UIImageView()
        imageVK.translatesAutoresizingMaskIntoConstraints = false
        imageVK.image = UIImage(named: "logo.png")
        imageVK.contentMode = .scaleAspectFill
        imageVK.clipsToBounds = true
        imageVK.layer.masksToBounds = true
        return imageVK
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .systemGray6
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 16
        stackView.layer.cornerRadius = 10
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private lazy var loginTextFielld: UITextField = {
        let loginTextFielld = UITextField()
        loginTextFielld.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: loginTextFielld.frame.height))
        loginTextFielld.leftView = paddingView
        loginTextFielld.leftViewMode = .always
        loginTextFielld.backgroundColor = .systemGray6
        loginTextFielld.placeholder = "E-mail or phone"
        loginTextFielld.font = .systemFont(ofSize: 16)
        loginTextFielld.textColor = .black
        loginTextFielld.autocapitalizationType = .none
        
        return loginTextFielld
    }()
    
    private lazy var passwordTextFielld: UITextField = {
        let passwordTextFielld = UITextField()
        passwordTextFielld.translatesAutoresizingMaskIntoConstraints = false
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextFielld.frame.height))
        passwordTextFielld.leftView = paddingView
        passwordTextFielld.leftViewMode = .always
        passwordTextFielld.backgroundColor = .systemGray6
        passwordTextFielld.placeholder = "Password"
        passwordTextFielld.font = .systemFont(ofSize: 16)
        passwordTextFielld.textColor = .black
        passwordTextFielld.autocapitalizationType = .none
        passwordTextFielld.isSecureTextEntry = true
        
        return passwordTextFielld
    }()
    
    private let viewStack: UIView = {
        let viewStack = UIView()
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        viewStack.backgroundColor = .systemGray3
        viewStack.layer.borderWidth = 0.5
        viewStack.layer.borderColor = UIColor.lightGray.cgColor
        return viewStack
    }()
    
    private lazy var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.cornerRadius = 10.0
        logInButton.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: UIControl.State.normal)
        logInButton.layer.cornerRadius = 10
        logInButton.clipsToBounds = true
        return logInButton
    }()
    
    private var countPasswordLabel: UILabel = {
        let countPasswordLabel = UILabel()
        countPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        countPasswordLabel.backgroundColor = .white
        countPasswordLabel.textColor = UIColor.red
        countPasswordLabel.font = .boldSystemFont(ofSize: 12.0)
        return countPasswordLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //navigationController?.setNavigationBarHidden(true, animated: false)
        layoutLogInViewController()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)  //теперь отписывается, чтобы вью удалялась из памяти (подписались выше)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)   //теперь отписывается
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    private func shakeAnimationForLogin() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: loginTextFielld.center.x-10, y: loginTextFielld.center.y))
        
        loginTextFielld.layer.add(animation, forKey: "position")
    }
    
    private func shakeAnimationForPassword() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: passwordTextFielld.center.x-10, y: passwordTextFielld.center.y))
        
        passwordTextFielld.layer.add(animation, forKey: "position")
    }
    
    private func layoutLogInViewController() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(imageVK)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextFielld)
        stackView.addArrangedSubview(viewStack)
        stackView.addArrangedSubview(passwordTextFielld)
        contentView.addSubview(countPasswordLabel)
        contentView.addSubview(logInButton)
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.frameLayoutGuide.heightAnchor),
            
            imageVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            imageVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageVK.heightAnchor.constraint(equalToConstant: 100),
            imageVK.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: imageVK.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginTextFielld.topAnchor.constraint(equalTo: stackView.topAnchor),
            loginTextFielld.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginTextFielld.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            loginTextFielld.heightAnchor.constraint(equalToConstant: 49.75),
            
            viewStack.topAnchor.constraint(equalTo: loginTextFielld.bottomAnchor),
            viewStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            viewStack.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            viewStack.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordTextFielld.topAnchor.constraint(equalTo: viewStack.bottomAnchor),
            passwordTextFielld.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextFielld.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            passwordTextFielld.heightAnchor.constraint(equalToConstant: 49.75),
            
            countPasswordLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 2),
            countPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            countPasswordLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15),
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
        
    }
    
    @objc private func logInButtonPressed() {
        //shake animation
        if loginTextFielld.text!.isEmpty ||  passwordTextFielld.text!.isEmpty {
            if loginTextFielld.text!.isEmpty {
                shakeAnimationForLogin()
                if passwordTextFielld.text!.isEmpty {shakeAnimationForPassword() }
            }
            if passwordTextFielld.text!.isEmpty {shakeAnimationForPassword()}
        }
        // кол-во символов в пароле не < 5 и правильный ли логин и пароль
        if loginTextFielld.text!.count > 0 && passwordTextFielld.text!.count > 0 {
            countPassword()
            correctLogAndPass()
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)}
    }
    
    private func countPassword() {
        if loginTextFielld.text!.count > 0 && passwordTextFielld.text!.count < 5 {
            countPasswordLabel.text = "Пароль должен содержать не менее 5 символов!"
        }
    }
    
    
    private func correctLogAndPass() {
        if loginTextFielld.text != "123" || passwordTextFielld.text != "12345" {
            let alert = UIAlertController(title: "Внимание!", message: "Неправильный логин или пароль!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
}
