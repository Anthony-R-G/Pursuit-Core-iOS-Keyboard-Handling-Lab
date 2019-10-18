//
//  ViewController.swift
//  KeyboardHandlingLab
//
//  Created by Anthony Gonzalez on 10/17/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Username..."
        textField.borderStyle = .bezel
        self.scrollView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = true
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password..."
        textField.borderStyle = .bezel
        self.scrollView.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        button.layer.cornerRadius = 10
        button.showsTouchWhenHighlighted = true
        self.scrollView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var forgotButton: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.showsTouchWhenHighlighted = true
        self.scrollView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        self.scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var scrollView = UIScrollView(frame: UIScreen.main.bounds)
    var contentView = UIView()
    
    lazy var bottomScrollConstraint: NSLayoutConstraint = {
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    }()
    
    @objc func handleKeyboardAppearing(sender: Notification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 300)
//        bottomScrollConstraint = scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300)
       
        scrollView.updateContentView()
        
    }
    
    @objc func handleKeyboardDisappearing(sender: Notification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
       
        scrollView.updateContentView()
    }
    
    
    private func setConstraints() {
        configureTextFieldConstraints()
        configureLoginButtonConstraints()
        configureForgotPasswordConstraints()
        configureImageConstraints()
        
    }
    private func configureTextFieldConstraints() {
        NSLayoutConstraint.activate([
            userNameTextField.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            userNameTextField.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor, constant: -200),
            userNameTextField.widthAnchor.constraint(equalToConstant: 350),
            userNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            passwordTextField.centerXAnchor.constraint(equalTo: userNameTextField.centerXAnchor),
            passwordTextField.centerYAnchor.constraint(equalTo: userNameTextField.centerYAnchor, constant: 70),
            passwordTextField.widthAnchor.constraint(equalToConstant: 350),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureLoginButtonConstraints() {
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -170),
            loginButton.widthAnchor.constraint(equalToConstant: 350),
            loginButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    private func configureForgotPasswordConstraints() {
        NSLayoutConstraint.activate([
            forgotButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            forgotButton.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 70),
            forgotButton.widthAnchor.constraint(equalToConstant: 350),
            forgotButton.heightAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
    private func configureImageConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: loginButton.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: userNameTextField.topAnchor, constant: -370),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureScrollViewConstraints(){
        scrollView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            bottomScrollConstraint
        ])
    }
    
    func configureContentViewConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor)
        ])
    }
    
    private func addKeyboardAppearObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardAppearing(sender:)), name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    private func addKeyboardDismissObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardDisappearing(sender:)), name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureScrollViewConstraints()
        configureContentViewConstraints()
        scrollView.updateContentView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardAppearObserver()
        addKeyboardDismissObserver()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9536138177, blue: 0.9102454782, alpha: 1)
        contentView.backgroundColor = #colorLiteral(red: 1, green: 0.9536138177, blue: 0.9102454782, alpha: 1)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        configureScrollViewConstraints()
        configureContentViewConstraints()
        setConstraints()
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension UIScrollView {
    func updateContentView() {
        
        contentSize.height = subviews.sorted(by: { $0.frame.maxY < $1.frame.maxY }).last?.frame.maxY ?? contentSize.height
        //Gets height based on object with largest Y-coordinate:
        //Goes through all subviews, finds their max Y position, and sorts them from least to greatest. The .last is the subview with the greatest Y position.
        //So the greatest Y position will be the height of the scroll view.
        
        contentSize.width = subviews.sorted(by: { $0.frame.maxX < $1.frame.maxX }).last?.frame.maxX ?? contentSize.width
        //Gets width based on object with largest X-coordinate
    }
}
