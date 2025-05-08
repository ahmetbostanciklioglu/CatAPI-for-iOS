//
//  CatAPIApp.swift
//  CatAPI
//
//  Created by Ahmet Bostanci on 7.05.2025.
//

import SwiftUI
import SwiftData

@main
struct CatApp: App {
    var sharedModelContainer: ModelContainer = {
        do {
            return try ModelContainer(for: CatDatabase.self)
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            CatsView()
        }
        .modelContainer(sharedModelContainer)
    }
}
