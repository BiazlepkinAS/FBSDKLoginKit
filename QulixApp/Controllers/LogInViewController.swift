
import UIKit

class LogInViewController: UIViewController {
    
    let pass: Array = ["1234", "5678","8901"]
    let userName: Array = ["test", "name"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        //MARK:- Login
        let loginLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            label.font = label.font.withSize(28)
            label.text = "Login"
            label.textColor = .white
            return label
        }()
        view.addSubview(loginLabel)
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            loginLabel.widthAnchor.constraint(equalToConstant: 200),
            loginLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
        //MARK:- LoginTextField
        
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .white
        view.addSubview(loginTextField)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.topAnchor.constraint(equalTo: loginLabel.topAnchor, constant: 50).isActive = true
        loginTextField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor).isActive = true
        loginTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //MARK:- PasswordLabel
        let passwordLabel = UILabel()
        passwordLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        passwordLabel.text = "Password"
        passwordLabel.font.withSize(30)
        passwordLabel.textColor = .white
        view.addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalTo: loginTextField.widthAnchor).isActive = true
        passwordLabel.heightAnchor.constraint(equalTo: loginTextField.heightAnchor).isActive = true
        
        //MARK:- PasswordTextField
        
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: passwordLabel.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: passwordLabel.heightAnchor),
        ])
        
        //MARK:- LoginButton
        
        let loginButton:UIButton = {
            let button2 = UIButton(type: .custom)
            button2.translatesAutoresizingMaskIntoConstraints = false
            button2.setTitle("Login", for: .normal)
            button2.setTitleColor(.blue, for: .normal)
            button2.layer.cornerRadius = 25
            button2.addTarget(self, action: #selector(loginViewPresent), for: .touchUpInside)
            return button2
        }()
        loginButton.backgroundColor = .yellow
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        // loginButton.addTarget(self, action: #selector(loginViewPresent), for: .touchUpInside)
        
        
        //MARK:- SignUpButton
        let signUpButton:UIButton = {
            let button = UIButton(type: .custom)
            button.isEnabled = false
            return button
        }()
        signUpButton.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        signUpButton.setTitle("Sign In", for: .normal)
        signUpButton.setTitleColor(.red, for: .normal)
        view.addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            signUpButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor),
            signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor),
        ])
    }
    @objc func loginViewPresent() {
        checkPass(arg: false)
    }
    func checkPass(arg:Bool) {
        for i in pass {
            if i == pass[0] {
                for i in userName {
                    if i == userName[0] {
                    } else {
                    }
                }
            }
            else {
                guard let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as? SettingsViewController else {return}
                present(controller, animated: true, completion: nil)
            }
        }
    }
}
