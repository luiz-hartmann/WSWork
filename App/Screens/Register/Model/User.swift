//
//  User.swift
//  App
//
//  Created by Luiz Hartmann on 20/11/22.
//

import Foundation

struct User: Codable {
    let id: Int
    let name, email, password: String
}
