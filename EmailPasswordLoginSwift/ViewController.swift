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
        //英字入力で最初の文字を大文字から小文字に変更
        emailField.autocapitalizationType = .none
        emailField.layer.cornerRadius = 8
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.backgroundColor = .white
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    
    private let passwordField:UITextField = {
        let passwordField = UITextField()
        passwordField.placeholder = "パスワード"
        passwordField.layer.borderWidth = 1
        passwordField.layer.cornerRadius = 8
        //文字を入力する際に文字が見えないようにする
        passwordField.isSecureTextEntry = true
        passwordField.layer.borderColor = UIColor.black.cgColor
        passwordField.backgroundColor = .white
        passwordField.leftViewMode = .always
        passwordField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return passwordField
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.setTitle("ログイン", for: .normal)
        return button
    }()
    
    private let signOutButton:UIButton = {
        let signOutButton = UIButton()
        signOutButton.backgroundColor = .white
        signOutButton.setTitleColor(.black, for: .normal)
        signOutButton.layer.cornerRadius = 8
        signOutButton.setTitle("ログアウト", for: .normal)
        return signOutButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.backgroundColor = .green
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            label.isHidden = true
            button.isHidden = true
            emailField.isHidden = true
            passwordField.isHidden = true
            
            view.addSubview(signOutButton)
            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 52)
            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        }
    }
    
    @objc private func logOutTapped(){
        do{
            try FirebaseAuth.Auth.auth().signOut()
            
            label.isHidden = false
            button.isHidden = false
            emailField.isHidden = false
            passwordField.isHidden = false
            signOutButton.removeFromSuperview()
        }catch{
            print("サインアウトできませんでした")
            
            
        }
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
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
    
    @objc private func didTapButton() {
        print("Button Taped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text,!password.isEmpty else {
                  print("エラー")
                  return
              }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            guard error == nil else{
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("サインインをしてください")
            strongSelf.label.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordField.isHidden = true
            strongSelf.button.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordField.resignFirstResponder()
        })
        
    }
    
    func showCreateAccount(email:String,password:String) {
        let alert = UIAlertController(title: "アカウントを作成してください", message: "アカウントを作成しましょう", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {_ in
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
                guard let strongSelf = self else {
                    return
                }
                guard error == nil else{
                    print("アカウントを作成しました")
                    return
                }
                
                print("サインインをしてください")
                strongSelf.label.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordField.isHidden = true
                strongSelf.button.isHidden = true
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordField.resignFirstResponder()
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in}))
        present(alert,animated: true)
    }


}

