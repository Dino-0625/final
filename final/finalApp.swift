//
//  finalApp.swift
//  final
//
//  Created by User02 on 2020/12/28.
//

import SwiftUI

@main
struct finalApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            //PlayerDetailView(playerID: 123)
            //PlayerList()
            PadreView()
            /*Myfavorite()*/.environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
