//
//  practicaIOSSuperpoderesApp.swift
//  practicaIOSSuperpoderes
//
//  Created by vero on 27/3/23.
//

import SwiftUI

@main
struct practicaIOSSuperpoderesApp: App {
//    let persistenceController = PersistenceController.shared
    
    @StateObject var rootViewModel = CharacterViewModel()
//    comento CoreData
//    let persistenceController = PersistenceController.shared
    

    var body: some Scene {
        
//        Inyecta la persistencia como una variable de entorno. Desde  SwiftUi accede a Coredata muy rápido
        
//        el objeto enviroment le pasa el context, con lo que desde cualquier vista de la app tengo acceso a CoreData como en UIKit
        WindowGroup {
            RootView().environmentObject(rootViewModel)
            //si desde la vista accedes a CoreData se salta el MVVM por eso
           /* ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)  */
        }
    }
}
