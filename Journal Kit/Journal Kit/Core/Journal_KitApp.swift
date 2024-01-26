//
//  Journal_KitApp.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import SwiftUI

@main
struct Journal_KitApp: App {
    
    @StateObject var notebookManger = NotebookViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(notebookManger)
        }
    }
}
