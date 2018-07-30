//
//  CoreDataHelper.swift
//  Messaging
//
//  Created by Connie Liu on 7/27/18.
//  Copyright © 2018 Connie Liu. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newNotif() -> Notif {
        let notif = NSEntityDescription.insertNewObject(forEntityName: "Notif", into: context) as! Notif
        
        return notif
    }
    
    static func save() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(notif: Notif) {
        context.delete(notif)
        
        save()
    }
    
    static func retrieveNotifs() -> [Notif] {
        do {
            let fetchRequest = NSFetchRequest<Notif>(entityName: "Notif")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }

}

