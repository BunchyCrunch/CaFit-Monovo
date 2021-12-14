//
//  User.swift
//  Cafit
//
//  Created by Josh Sparks on 12/6/21.
//

import SwiftUI

class User {
    var name: String
    var uid: String
    var birthday: String
    var height: Int
    var weight: Int
    var gender: String
    var fitnessLevel: String
    
    init(name: String = "", uid: String, birthday: String = "", height: Int, weight: Int, gender: String = "", fitnessLevel: String = ""){
        self.name = name
        self.uid = uid
        self.birthday = birthday
        self.height = height
        self.weight = weight
        self.gender = gender
        self.fitnessLevel = fitnessLevel
    }

}
