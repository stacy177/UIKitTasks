//
//  UserModel.swift
//  PetProject1
//
//  Created by User on 04.11.2022.
//

import Foundation

struct User {
    let firstName: String
    let secondName: String
    
    var fullName : String {
        firstName + " " + secondName
    }
}
