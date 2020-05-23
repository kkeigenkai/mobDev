//
//  DBHelper.swift
//  lab_4
//
//  Created by Sergei Pshonnov on 21.05.2020.
//  Copyright © 2020 Sergei Pshonnov. All rights reserved.
//

import Foundation
import SQLite3

class DBHelper: ObservableObject {
    init() {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db: OpaquePointer?
    
    func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
            return nil
        } else {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS contact(id TEXT PRIMARY KEY, name TEXT, surname TEXT, number TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("preson table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(id: String, name: String, surname: String, number: String) {
        let insertStatementString = "INSERT INTO contact (id, name, surname, number) VALUES(?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (id as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (surname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, (number as NSString).utf8String, -1, nil)
            
            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT statement could not be prepared.")
        }
        
        sqlite3_finalize(insertStatement)
    }
    
    func update(id: String, name: String, surname: String, number: String) {
        let updateStatementString = "UPDATE contact SET name = ?, surname = ?, number = ? WHERE id = ?;"
        var updateStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(updateStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 2, (surname as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 3, (number as NSString).utf8String, -1, nil)
            sqlite3_bind_text(updateStatement, 4, (id as NSString).utf8String, -1, nil)
            
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("Successfully updated row.")
            } else {
                print("Could not update row.")
            }
        } else {
            print("UPDATE statement could not be prepared.")
        }
        
        sqlite3_finalize(updateStatement)
    }
    
    func read() -> [Contact] {
        let queryStatementString = "SELECT * FROM contact;"
        var queryStatement: OpaquePointer? = nil
        var contact: [Contact] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let id = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let surname = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let number = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                contact.append(Contact(id: id, name: name, surname: surname, number: number))
                
                print("Query Result:")
                print("\(id) | \(name) | \(surname) | \(number).")
            }
        } else {
            print("SELECT statement could not be prepared.")
        }
        
        sqlite3_finalize(queryStatement)
        return contact
    }
    
    func deleteById(id: String) {
        let deleteStatementString = "DELETE FROM contact WHERE id = ?;"
        var deleteStatement: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, deleteStatementString, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(deleteStatement, 1, (id as NSString).utf8String, -1, nil)
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        
        sqlite3_finalize(deleteStatement)
    }
}
