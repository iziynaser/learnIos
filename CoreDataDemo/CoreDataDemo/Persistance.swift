//
//  Persistance.swift
//  CoreDataDemo
//
//  Created by IZIY on 8/20/23.
//

import Foundation
import CoreData


struct PersistenceController {
    
    static let shared = PersistenceController()
    let container : NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name: "Products")
        container.loadPersistentStores { (storeDescription, error ) in
            if let error = error as NSError? {
                fatalError("container load failed: \(error)")
            }
        }
    }
    
}
