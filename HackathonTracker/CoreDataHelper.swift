//
//  CoreDataHelper.swift
//  HackathonTracker
//
//  Created by Emily Lam on 7/17/18.
//  Copyright © 2018 Make School. All rights reserved.
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
    
    static func newPData() -> PData {
        let pData = NSEntityDescription.insertNewObject(forEntityName: "PData", into: context) as! PData
        
        return pData
    }
    
    static func save() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func delete(pData: PData) {
        context.delete(pData)
        
        save()
    }
    
    static func retrieve() -> [PData] {
        do {
            let fetchRequest = NSFetchRequest<PData>(entityName: "PData")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
}
