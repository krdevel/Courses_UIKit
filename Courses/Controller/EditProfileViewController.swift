//
//  EditProfileViewController.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-20.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    @IBOutlet var editNameLabel: UITextField?
    
    var testNameString: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        editNameLabel?.text = testNameString
    }
    

}
