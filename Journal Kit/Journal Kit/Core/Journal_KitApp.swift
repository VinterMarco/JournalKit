//
//  Journal_KitApp.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import SwiftUI
import Firebase


@main
struct Journal_KitApp: App {
    
    @StateObject var notebookManger = NotebookViewModel()

    
    init() {
          FirebaseApp.configure()
      }

    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .tint(.orange)
                .environmentObject(notebookManger)
        }
    }
}
