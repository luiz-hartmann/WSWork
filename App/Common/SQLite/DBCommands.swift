//
//  Commands.swift
//  App
//
//  Created by Luiz Hartmann on 20/11/22.
//

import Foundation
import SQLite

class DBCommands {
    
    static var users = Table("Users")
    
    static let id = Expression<Int>("id")
    static let name = Expression<String>("name")
    static let email = Expression<String>("email")
    static let password = Expression<String>("password")
    
    static func createTable() {
        guard let database = DB.sharedInstance.database else {
            print("Datastore connection error")
            return
        }
        
        do {
            try database.run(users.create(ifNotExists: true) { users in
                users.column(id, primaryKey: true)
                users.column(name)
                users.column(email, unique: true)
                users.column(password)
            })
            
        } catch {
            print("Table already exists: \(error)")
        }
    }
    
    static func insertRow(_ userViewModel: UserViewModel) -> Bool? {
        guard let database = DB.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        do {
            try database.run(users.insert(name <- userViewModel.username,
                                          email <- userViewModel.email,
                                          password <- userViewModel.password))
            return true
            
        } catch let Result.error(message, _, statement) {
            print("Insert row failed: \(message), in \(String(describing: statement))")
            return false
            
        } catch let error {
            print("Insert failed: \(error)")
            return false
        }
    }
    
    static func presentRows() -> [User]? {
        guard let database = DB.sharedInstance.database else {
            print("Datastore connection error")
            return nil
        }
        
        var userArray = [User]()
        
        users = users.order(id.desc)
        
        do {
            
            for user in try database.prepare(users) {
                let idValue = user[id]
                let nameValue = user[name]
                let emailValue = user[email]
                let passwordValue = user[password]
                
                let userObject = User(id: idValue,
                                      name: nameValue,
                                      email: emailValue,
                                      password: passwordValue)
                
                userArray.append(userObject)
                
                print("id \(user[id]), name: \(user[name]), email: \(user[email]), password: \(user[password])")
            }
            
        } catch {
            print("Present row error: \(error)")
        }
        
        return userArray
    }
}
