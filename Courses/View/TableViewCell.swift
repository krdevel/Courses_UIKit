//
//  CategoryTableViewCell.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-13.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var theImageView: UIImageView? //The name imageView can't be used as a variable name...
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var descriptionLabel: UILabel?
    
    var course: Course?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        // Setup favourite button
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func favouriteButtonAction(_ sender: Any) {
        let button = sender as! UIButton
        if let currentCourse = course {
            if user.courseIsFavourite(currentCourse) == true {
                button.makeFavourite(false)
                user.removeFromFavourites(currentCourse)
            } else {
                button.makeFavourite(true)
                user.addToFavourites(currentCourse)
            }
        }
        
    }
    
}
