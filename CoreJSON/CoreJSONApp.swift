//
//  CoreJSONApp.swift
//  CoreJSON
//
//  Created by Вячеслав Квашнин on 16.07.2021.
//

import SwiftUI

@main
struct CoreJSONApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
