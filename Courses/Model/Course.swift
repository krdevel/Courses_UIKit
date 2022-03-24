//
//  Course.swift
//  Courses
//
//  Created by Kristian Bredin on 2022-01-13.
//

import Foundation

struct Course {
    var name: String
    var description: String
    var detailedDescription: String
    var image: String
    var isFavourite: Bool //Probably have a User object, where courses can be favourited, purchased etc.
    var ID: String

    
    init(name: String) {
        self.name = name
        self.description = "Description coming soon"
        self.detailedDescription = "Detailed description coming soon"
        self.image = ""
        self.isFavourite = false  // For now
        self.ID = ""
    }
    
    init(name: String, description: String, detailedDescription: String, image: String, ID: String) {
        self.init(name: name) //Calling initializer above
        self.description = description
        self.detailedDescription = detailedDescription
        self.image = image
        self.ID = ID
    }
    
}
