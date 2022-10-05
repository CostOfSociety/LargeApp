//
//  AboutMeViewController.swift
//  LargeApp
//
//  Created by Святослав on 04.10.2022.
//

import UIKit

class AboutPersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var departmentLabel: UILabel!
    @IBOutlet weak var jobTitle: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(
            topColor: UIColor.systemPink,
            bottomColor: UIColor.purple
        )
        
        setupLabels()
        changeNavigationTitle()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? DescriptionViewController else {return}
        descriptionVC.descriptionOfPerson = person.textDescription
        descriptionVC.personName = person.firstName
            
    }
    private func changeNavigationTitle() {
        navigationItem.title = person.firstName
        
    }
    private func setupLabels() {
        nameLabel.text = person.firstName
        lastNameLabel.text = person.lastName
        companyLabel.text = person.company
        departmentLabel.text = person.department
        jobTitle.text = person.jobTitle
    }
}
