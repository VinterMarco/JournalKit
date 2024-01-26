

//
//  WriteMainView.swift
//  Journal Kit
//
//  Created by Vinter Marco on 25.01.2024.
//

import SwiftUI

struct WriteMainView: View {
    
    @State private var title : String = ""
//  @State private var text : String = "We walked along the cost of Bristol. I remember that it was sunny and the smell of salt an her sweet parfume ..."
    @State private var text : String = "Write your memories..."
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    TextField("Title...", text: $title)
                        .padding()
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                    TextEditor(text: $text)
                        .padding()
                        .colorMultiply(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .foregroundColor(text == "Write your memories..." ? .gray : .black)
                    Button("Sent") {
                        
                    }
                }
                .padding()
                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                .clipShape(.rect(cornerRadius: 44))
            }
            .padding()
        }
    }
}

#Preview {
    WriteMainView()
}

