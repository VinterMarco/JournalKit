//
//  NavigationView.swift
//  Journal Kit
//
//  Created by Vinter Marco on 25.01.2024.
//

import SwiftUI

struct NavigationView: View {
    var body: some View {
        TabView {
            Text("View 1")
                .tabItem {
                    Label("Noterbooks", systemImage: "list.dash")
                }
            
            WriteMainView()
                .tabItem {
                    Label("Write", systemImage: "square.and.pencil")
                }
        }
    }
}
    
    #Preview {
        NavigationView()
    }
