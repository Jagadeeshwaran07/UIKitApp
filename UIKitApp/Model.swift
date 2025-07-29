//
//  Model.swift
//  UIKitApp
//
//  Created by Jagadeeshwaran M on 29/07/25.
//



import Foundation

struct UserResponse: Codable {
    let data: [PersonResponse]
}
        
struct PersonResponse: Codable {
    let email: String
    let firstName: String
    let lastName: String
}
