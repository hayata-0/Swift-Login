//
//  ViewController.swift
//  EmailPasswordLoginSwift
//
//  Created by 大野颯太 on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    private let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Login"
        label.font = .systemFont(ofSize:24,weight: .semibold)
        return label
    }()
    
    private let emailField:UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "メールアドレス"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    }()
    
    private let passwordField:UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "パスワード"
        passwordField.layer.borderWidth = 1
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        return passwordField
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("ログイン", for: .normal)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
    }


}

