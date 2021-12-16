//
//  DatabaseManager.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import Foundation
import CoreData
import SwiftUI

struct DatabaseManager {
    static let shared = DatabaseManager()
    
    private var viewContext = PersistenceController.shared.container.viewContext
    
    private init() {
    }
    
    // Store all StarWar items fetched from network
    func addStarWarListItems(_ items: [StarWarData]) {
        // Clear all item before storing new
        deleteAllStarWarItems()
        
        let _:[StarWarEntities] = items.compactMap { (starWar) -> StarWarEntities in
            let entity = StarWarEntities(context: self.viewContext)
            entity.id = starWar.id
            entity.date = starWar.date
            entity.title = starWar.title
            entity.image = starWar.image
            entity.story = starWar.starWarExplaination
            entity.firstlocationline = starWar.firstlocationline
            entity.secondlocationline = starWar.secondlocationline
            
            return entity
        }
        
        saveContext()
    }
    
    // Fetch all stored starWar items
    func fetchAllStarWarItems()->[StarWarEntities] {
        var result = [StarWarEntities]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StarWarEntities")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \StarWarEntities.id, ascending: true)]
        do {
            if let all = try viewContext.fetch(request) as? [StarWarEntities] {
                result = all
            }
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        return result
    }
    
    // Delete all stored starWar items
    func deleteAllStarWarItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "StarWarEntities")
        do {
            if let all = try viewContext.fetch(request) as? [StarWarEntities] {
                for catItem in all {
                    viewContext.delete(catItem)
                }
            }
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        saveContext()
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
