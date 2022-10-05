//
//  WelcomeViewController.swift
//  LargeApp
//
//  Created by Святослав on 01.10.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var greatingLabel: UILabel!

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(
            topColor: UIColor.systemPink,
            bottomColor: UIColor.purple
        )
        greatingLabel.text = "Welcome, " + username
    }
}
