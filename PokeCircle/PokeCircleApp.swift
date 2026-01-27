//
//  PokeCircleApp.swift
//  PokeCircle
//
//  Created by Shivank Ahuja on 1/27/26.
//

import SwiftUI
import CoreData

@main
struct PokeCircleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
