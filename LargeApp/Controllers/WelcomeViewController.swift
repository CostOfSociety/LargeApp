//
//  WelcomeViewController.swift
//  LargeApp
//
//  Created by Святослав on 01.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var greatingLabel: UILabel!
    @IBOutlet weak var logoutButton: UIButton!

    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientLayer()
        greatingLabel.textColor = .white
        logoutButton.setTitleColor(.white, for: .normal)
        
        greatingLabel.text = "Welcome, " + username
        
    }
    private func setupGradientLayer() {
        let gradientLayer = CAGradientLayer()
        let colorTop = UIColor.systemPink.cgColor
        let colorMiddle = UIColor.purple.cgColor
        let colorBottom = UIColor.blue.cgColor
        gradientLayer.colors = [colorTop,colorMiddle, colorBottom]
        gradientLayer.locations = [0, 1]
        gradientLayer.frame = mainView.bounds
        mainView.layer.insertSublayer(gradientLayer, at: 0)
        
    }

}
