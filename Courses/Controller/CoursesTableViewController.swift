//
//  CoursesTableViewController.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-13.
//

import UIKit

class CoursesTableViewController: UITableViewController {
    
    var category: Category?
    var courses: [Course]?
    var courseIndexPassedToNextController: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let recievedCategory = category {
            navigationItem.title = recievedCategory.name // Causes back arrow title to default to "Back"...
        } else {
            print("No recievedCategory....")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifyer = "categoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifyer, for: indexPath) as! TableViewCell
        if let foundCourses = courses {
            let currentCourse = foundCourses[indexPath.row]
            cell.nameLabel?.text = currentCourse.name
            cell.descriptionLabel?.text = currentCourse.description
            cell.theImageView?.image = UIImage(named: currentCourse.image)
            
            cell.course = currentCourse // For favourite...
        }
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "course" {
            if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
                let index = indexPath.row
                let destinationController = segue.destination as! CourseViewController
                destinationController.course = courses?[index]
                destinationController.coursesTableViewController = self
                courseIndexPassedToNextController = index
            }
        }
    }

    
}
