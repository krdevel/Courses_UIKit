//
//  ViewController.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-13.
//

import UIKit

/* BUGS
 prefersLargeTitles blir liten efter landscape (och Courses-sidan får stor...)
 */

/* TODO
 Logik för favoriter.
 Bättre layout av texter.
 */

//Singleton, (by means of a global variable...)
var user = User(coursesPurchased: [], coursesFavourited: []) //coursesFavourited: ["DEF23456"]

class CategoriesTableViewController: UITableViewController {
    
    //Hardcoded object graph
    var categories: [Category] = [Category(name: "Software development", description: "Learn how to code", image: "software_development", courses: [Course(name: "JavaScript", description: "Learn JavaScript", detailedDescription: "Master JavaScript", image: "javaScript", ID: "ABC12345"),
                                                                                                                                                    Course(name: "Swift", description: "Learn Swift", detailedDescription: "Once you have completed this course, you will be a better Swift developer...", image: "swiftWithOverlay_5_2", ID: "DEF23456")]),
                                  Category(name: "Music", description: "Learn a new musical skill", image: "music", courses: [Course(name: "Acoustic Guitar", description: "Learn how to master the acoustic guitar, with this comprehensive course", detailedDescription: "Impress your friends with some nice tunes!", image: "guitar", ID: "GHI34567")] )]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifyer = "categoryCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifyer, for: indexPath) as! TableViewCell
        let currentCategory = categories[indexPath.row]
        cell.nameLabel?.text = currentCategory.name
        cell.descriptionLabel?.text = currentCategory.description
        cell.theImageView?.image = UIImage(named: currentCategory.image)
        
        return cell
    }
    
    //Tranfer object to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check the identifyer of the segue...
        if segue.identifier == "courses" {
            if let indexPath: IndexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! CoursesTableViewController
                //Pass the Courses array to the CoursesTableViewController
                let choosenCategory = categories[indexPath.row]
                destinationController.category = choosenCategory
                destinationController.courses = choosenCategory.courses
            }
        }
    }
    
    
}

