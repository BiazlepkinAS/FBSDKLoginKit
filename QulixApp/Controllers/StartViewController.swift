import UIKit
import FBSDKLoginKit 

class StartViewController: UIViewController, LoginButtonDelegate {
    
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        let token = result?.token?.tokenString
        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                 parameters: ["fields": "email , name"],
                                                 tokenString: token,
                                                 version: nil,
                                                 httpMethod: .get)
        request.start(completionHandler: {connection, result, error in
            print("\(result ?? "none")")
        })
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if let token = AccessToken.current, !token.isExpired {
            let token = token.tokenString
            let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
                                                     parameters: ["fields": "email , name"],
                                                     tokenString: token,
                                                     version: nil,
                                                     httpMethod: .get)
            request.start(completionHandler: {connection, result, error in
                print("\(String(describing: result))")
            })
        }
        else {
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
        
        let appImage:UIImageView = {
            let appImage = UIImageView()
            appImage.image = UIImage(named: "Logo")
            appImage.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            appImage.layer.cornerRadius = 10
            appImage.translatesAutoresizingMaskIntoConstraints = false
            return appImage
        }()
        view.addSubview(appImage)
        appImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        appImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        let loginButton2:UIView = {
            let button = UIButton()
            button.layer.cornerRadius = 15
            button.backgroundColor = .white
            button.setTitle("Enter", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(settingsPresent), for: .touchUpInside)
            return button
        }()
        view.addSubview(loginButton2)
        loginButton2.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        loginButton2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        loginButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        loginButton2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginButton2.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        let someText:UILabel = {
            let someT = UILabel()
            someT.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            someT.text = "Уже есть аккаунт?"
            someT.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            someT.font.withSize(15)
            someT.translatesAutoresizingMaskIntoConstraints = false
            return someT
        }()
        view.addSubview(someText)
        someText.bottomAnchor.constraint(equalTo: loginButton2.topAnchor, constant: -10).isActive = true
        someText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someText.widthAnchor.constraint(equalToConstant: 150).isActive = true
        someText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        let loginAppleButton:UIButton = {
            let loginAppleB = UIButton()
            
            loginAppleB.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            loginAppleB.setTitleColor(.white, for: .normal)
            loginAppleB.setTitle("🍏 Войти с помощью Apple", for: .normal)
            loginAppleB.layer.cornerRadius = 15
            loginAppleB.layer.borderWidth = 1.5
            loginAppleB.layer.borderColor = UIColor(displayP3Red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
            // loginAppleB.addTarget(self, action: #selector(settingsPresent), for: .touchUpInside)
            loginAppleB.translatesAutoresizingMaskIntoConstraints = false
            return loginAppleB
        }()
        view.addSubview(loginAppleButton)
        
        loginAppleButton.bottomAnchor.constraint(equalTo: loginButton2.topAnchor, constant: -160).isActive = true
        loginAppleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginAppleButton.widthAnchor.constraint(equalTo: loginButton2.widthAnchor).isActive = true
        loginAppleButton.heightAnchor.constraint(equalTo: loginButton2.heightAnchor).isActive = true
        
        
        let signUpButton: UIButton = {
            let signUp = UIButton()
            signUp.backgroundColor = #colorLiteral(red: 0, green: 0.7428922057, blue: 0, alpha: 1)
            signUp.setTitle("Зарегистрироваться", for: .normal)
            signUp.setTitleColor(.white, for: .normal)
            signUp.layer.cornerRadius = 15
            
            signUp.translatesAutoresizingMaskIntoConstraints = false
            return signUp
        }()
        view.addSubview(signUpButton)
        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 190).isActive = true
        //        signUpButton.bottomAnchor.constraint(equalTo: loginButton2.topAnchor, constant: -40).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: loginButton2.widthAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalTo: loginButton2.heightAnchor).isActive = true
        
        
    }
    
    @objc func settingsPresent() {
        
        guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewController") as? LogInViewController else {
            return
        }
        present(controller, animated: true, completion: nil)
    }
}
