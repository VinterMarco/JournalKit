//
//  SendJournalNotes.swift
//  Journal Kit
//
//  Created by Vinter Marco on 29.01.2024.
//

import SwiftUI

struct SendJournalNotes: View {
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            VStack {
                Button {
                    // more code to cme 
                } label: {
                    Text("Send")
                        .padding()
                        .background(.black)
                        .foregroundColor(.white).bold()
                        .cornerRadius(10)
                }
            }
        }
    }
}

#Preview {
    SendJournalNotes()
}
