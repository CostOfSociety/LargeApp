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
    
    private let user = User.getDataAboutPerson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTF.text = user.username
        passwordTF.text = user.password
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "goToWelcomeVC" else {return}
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        viewControllers.forEach { viewController  in
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.username = self.usernameTF.text
            } else if let navigationVC = viewController as? UINavigationController {
                let viewControllers = navigationVC.viewControllers
                viewControllers.forEach { viewController in
                    if let aboutPersonVC = viewController as? AboutPersonViewController {
                        aboutPersonVC.person = user.person
                    }
                }
            }
        }
    }
    
    @IBAction func loginButtonDidPressed() {
        if user.password == passwordTF.text && user.username == usernameTF.text  {
            performSegue(withIdentifier: "goToWelcomeVC", sender: nil)
        } else {
            createAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTF
            )
        }
    }
    
    @IBAction func foggotUsernameDidPressed() {
        createAlert(
            title: "Oops",
            message: "Your name is User or Any name 😳"
        )
    }
    
    @IBAction func foggotPasswordDidPressed() {
        createAlert(
            title: "Oops",
            message: "Your password is Password 🤬"
        )
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    private func createAlert(title: String, message: String, textField: UITextField? = nil ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            textField?.text = ""
        }
        alert.addAction(alertAction)
        present(alert,animated: true ,completion: nil)
    }
    
}
