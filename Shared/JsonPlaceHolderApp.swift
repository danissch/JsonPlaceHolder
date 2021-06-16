//
//  JsonPlaceHolderApp.swift
//  Shared
//
//  Created by Daniel Duran Schutz on 15/06/21.
//

import SwiftUI

@main
struct JsonPlaceHolderApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AlbumListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
