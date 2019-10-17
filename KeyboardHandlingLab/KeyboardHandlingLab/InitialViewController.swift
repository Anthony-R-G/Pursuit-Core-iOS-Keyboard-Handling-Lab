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
    
    lazy var myView: UIView = { [unowned self] in
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        var frame = view.frame
        frame.size.width = 200
        frame.size.height = 200
        view.frame = frame
        view.layer.cornerRadius = view.frame.width / 2
        return view
        }()
    
    lazy var myViewHeightConstraint: NSLayoutConstraint = {
        myView.heightAnchor.constraint(equalToConstant: myView.frame.height)
    }()
    
    lazy var myViewWidthConstraint: NSLayoutConstraint = {
        myView.widthAnchor.constraint(equalToConstant: myView.frame.width)
    }()
    
    lazy var myViewCenterXConstraint: NSLayoutConstraint = {
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var myViewTopAnchorConstraint: NSLayoutConstraint = {
        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: myViewHeightConstraint.constant)
    }()
    
    @objc private func tapGestureTapped(sender: UIView) {
          let destVC = ViewController()
        present(destVC, animated: true, completion: nil)
      }
    
    private func configureMyViewConstraints() {
        myView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
                myViewHeightConstraint,
                myViewWidthConstraint,
                myViewCenterXConstraint,
                myViewTopAnchorConstraint
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
