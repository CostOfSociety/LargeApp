//
//  ViewController.swift
//  LargeApp
//
//  Created by Святослав on 01.10.2022.
//

import UIKit


class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private enum Utilit: String {
        case password = "Password"
    }
    override func viewDidLoad() {
        usernameTF.delegate = self
        passwordTF.delegate = self
    }
    

    @IBAction func loginButtonDidPressed() {
        guard let password = passwordTF.text else {return}
        if password == Utilit.password.rawValue  {
            performSegue(withIdentifier: "goToWelcomeVC", sender: self)
        } else {
            creatWrongPasswordAlert()
        }
    }
    
    @IBAction func foggotUsernameDidPressed() {
        let alert = UIAlertController(title: "Oops", message: "Your name is User or Any name 😳", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func foggotPasswordDidPressed() {
        let alert = UIAlertController(title: "Oops", message: "Your password is Password 🤬", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(alertAction)
        present(alert,animated: true,completion: nil)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        guard let welcomeVC = segue.source as? WelcomeViewController else { return }
        usernameTF.text = welcomeVC.username
        passwordTF.text = ""
        loginButton.isEnabled = false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToWelcomeVC" else {return}
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = usernameTF.text == "" ? "User": usernameTF.text
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func creatWrongPasswordAlert() {
        let alert = UIAlertController(title: "Invalid login or password", message: "Please, enter correct login and password", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { [weak self] _ in
            self?.passwordTF.text = ""
        }
        alert.addAction(alertAction)
        present(alert,animated: true,completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if usernameTF.text != "" && passwordTF.text != "" {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
}
