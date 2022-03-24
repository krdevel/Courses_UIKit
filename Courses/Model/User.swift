//
//  User.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-19.
//

import Foundation

struct User {
    
    var coursesPurchased: [String]  //CourseID's
    var coursesFavourited: [String] //CourseID's
    
    // Singleton?
    
    //Or simply as a global variable (outside of CategoriesTableViewController, but in that file)
    
    func courseIsFavourite(_ course: Course) -> Bool {
        return coursesFavourited.contains(course.ID)
    }
    
    mutating func addToFavourites(_ course: Course) {
        coursesFavourited.append(course.ID)
    }
    
    mutating func removeFromFavourites(_ course: Course) {
        if let index = coursesFavourited.firstIndex(of: course.ID) {
            coursesFavourited.remove(at: index)
        }
    }
    
    
}

