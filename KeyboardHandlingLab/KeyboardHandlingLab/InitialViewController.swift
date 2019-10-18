//
//  InitialViewController.swift
//  KeyboardHandlingLab
//
//  Created by Anthony Gonzalez on 10/17/19.
//  Copyright © 2019 Antnee. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    lazy var tappedScreenRecognizer: UILongPressGestureRecognizer = {
        let tapGesture = UILongPressGestureRecognizer(target: self, action: #selector(tapGestureTapped))
        return tapGesture
    }()
    
    lazy var myView: UIImageView = { [unowned self] in
        let view = UIImageView()
        view.isUserInteractionEnabled = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        view.image = #imageLiteral(resourceName: "lock")
        var frame = view.frame
        frame.size.width = 200
        frame.size.height = 200
        view.frame = frame
        view.layer.cornerRadius = view.frame.width / 2
        return view
        }()
    
    lazy var label: UILabel = { [unowned self] in
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        view.addSubview(label)
        label.text = "Hold Lock"
        return label
    }()
    
    
    @objc private func tapGestureTapped(sender: UIView) {
        let destVC = ViewController()
        present(destVC, animated: true, completion: nil)
    }
    
    private func configureMyViewConstraints() {
        myView.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            myView.heightAnchor.constraint(equalToConstant: myView.frame.height),
            myView.widthAnchor.constraint(equalToConstant: myView.frame.width),
            myView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            label.heightAnchor.constraint(equalToConstant: 30),
            label.widthAnchor.constraint(equalToConstant: 80),
            label.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: myView.centerYAnchor, constant: 150)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9536138177, blue: 0.9102454782, alpha: 1)
        view.addSubview(myView)
        configureMyViewConstraints()
        self.myView.addGestureRecognizer(tappedScreenRecognizer)
    }
}
