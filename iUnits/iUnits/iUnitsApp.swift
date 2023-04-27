//
//  iUnitsApp.swift
//  iUnits
//
//  Created by Israel Manzo on 4/27/23.
//

import SwiftUI

@main
struct iUnitsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
