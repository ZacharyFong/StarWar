//
//  PhunProjectApp.swift
//  PhunProject
//
//  Created by Zachary Fong on 11/20/21.
//

import SwiftUI

@main
struct PhunProjectApp: App {
//    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
                DatabaseManager.shared.saveContext()
            @unknown default:
                fatalError()
            }
        }
    }
}
