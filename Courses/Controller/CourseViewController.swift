//
//  CourseViewController.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-16.
//

import UIKit

extension UIButton {
    func makeFavourite(_ condition: Bool) {
        var imageName: String
        if condition == true {
            imageName = "heart.fill"
        } else {
            imageName = "heart"
        }
        self.setImage(UIImage(systemName: imageName), for: .normal)
    }
}


class CourseViewController: UIViewController {
    var course: Course?
    
    @IBOutlet var theImageView: UIImageView?
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var courseDescriptionLabel: UILabel!
    @IBOutlet weak var courseDetailedDescriptionLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    var coursesTableViewController: CoursesTableViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseNameLabel.text = course?.name
        courseDescriptionLabel.text = course?.description
        courseDetailedDescriptionLabel.text = course?.detailedDescription
        theImageView?.image = UIImage(named: course?.image ?? "")
        
        // Setup favourite button
        
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        if course?.isFavourite == true {
            favouriteButton.makeFavourite(false)
            course?.isFavourite = false
        } else {
            favouriteButton.makeFavourite(true)
            course?.isFavourite = true
        }
    }
    

    
}
