//
//  ProfileViewController.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-20.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func dismissEditController(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: {
            print("dismissEditController")
        })
    }
    
    @IBAction func getChangesFromEditController(segue: UIStoryboardSegue) {
        print("getChangesFromEditController")
        if let sourceController = segue.source as? EditProfileViewController {
            nameLabel?.isEnabled = true
            nameLabel?.text = sourceController.editNameLabel?.text
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let targetController = segue.destination as? EditProfileViewController {
            if nameLabel?.isEnabled == true {
                targetController.testNameString = nameLabel?.text
            }
        }
    }
    
    

    
}
