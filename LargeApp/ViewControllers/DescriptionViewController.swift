//
//  DescriptionViewController.swift
//  LargeApp
//
//  Created by Святослав on 05.10.2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var descriptionOfPerson: String!
    var personName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = descriptionOfPerson
        navigationItem.title = personName + " " + "Bio"
    }
    
}
