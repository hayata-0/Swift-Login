//
//  ViewController.swift
//  EmailPasswordLoginSwift
//
//  Created by 大野颯太 on 2022/02/07.
//

import UIKit
import FirebaseAuth

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
        //文字を入力する際に文字が見えないようにする
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
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x:0,y:100,width: view.frame.size.width,height: 80)
        
        emailField.frame = CGRect(x:20,
                                  y:label.frame.origin.y+label.frame.size.height+10,
                                  width: view.frame.size.width-40,
                                  height: 50)
        
        passwordField.frame = CGRect(x:20,
                                     y:emailField.frame.origin.y+emailField.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        
        button.frame = CGRect(x:20,
                              y:passwordField.frame.origin.y+passwordField.frame.size.height+30,
                              width: view.frame.size.width-40,
                              height: 52)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    @objc private func didTapButton() {
        print("Button Taped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text,!password.isEmpty else {
                  print("エラー")
                  return
              }
              
    }


}

