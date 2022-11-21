//
//  DB.swift
//  App
//
//  Created by Luiz Hartmann on 20/11/22.
//

import Foundation
import SQLite

class DB {
    
    static let sharedInstance = DB()
    var database: Connection?
    
    private init() {
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory,
                                                                in: .userDomainMask,
                                                                appropriateFor: nil, create: true)
            
            let fileURL = documentDirectory
                .appendingPathComponent("App")
                .appendingPathExtension("sqlite3")
            
            database = try Connection(fileURL.path)
            
        } catch {
            print("Creating connection to database error: \(error)")
        }
    }
    
    func createTable() {
        DBCommands.createTable()
    }
}
