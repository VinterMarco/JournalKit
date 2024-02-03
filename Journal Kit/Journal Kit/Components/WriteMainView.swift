

//
//  WriteMainView.swift
//  Journal Kit
//
//  Created by Vinter Marco on 25.01.2024.
//

import SwiftUI
import PhotosUI

struct WriteMainView: View {
    
    @StateObject private var photoPickerManager = PhotoPickerViewModel()
    @EnvironmentObject var notebookManager : NotebookViewModel
    
    
    
    @State private var title : String = ""
    @State private var titleForNew : String = ""
    @State private var openSheet : Bool = false
    @State private var selectedNotebook : String = "Chocolate"
    @State private var typeOfNotebook : String = "New"
    //  @State private var text : String = "We walked along the cost of Bristol. I remember that it was sunny and the smell of salt an her sweet parfume ..."
    @State private var text : String = ""
    @State private var textForNew : String = ""
    var body: some View {
        NavigationStack {
            VStack {
                VStack (alignment:.leading) {
                    
                    Section {
                        if !photoPickerManager.selectedImages.isEmpty {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(photoPickerManager.selectedImages, id: \.self) { image in
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(.rect(cornerRadius: 10))
                                            .overlay {
                                                VStack {
                                                    HStack {
                                                        VStack {
                                                            Image(systemName: "xmark.square.fill")
                                                                .foregroundStyle(.red)
                                                            Spacer()
                                                        }
                                                        Spacer()
                                                    }
                                                }
                                                .frame(width: .infinity, height: .infinity)
                                                .onTapGesture {
                                                    photoPickerManager.deleteImage(image)
                                                    print("tapped red \(image)")
                                                }
                                                
                                            }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    
                    Text("New or existing notebook")
                        .foregroundColor(Color.white)
                    //                        .foregroundStyle(Color(red: 0.50, green: 0.50, blue: 0.50))
                        .offset(y:10)
                        .fontWeight(.regular)
                        .padding()
                    Picker("", selection: $typeOfNotebook) {
                        Text("New").tag("New")
                        Text("Existing").tag("Existing")
                    }
                    .pickerStyle(.segmented)
                    
                }
                .padding()
                List {
                    if typeOfNotebook == "Existing" {
                        Section (header:
                                    Text("My Notebooks")
                            .foregroundColor(Color.white)
                        ){
                            Picker("Selected Noteboook", selection: $selectedNotebook) {
                                Text("Chocolate").tag("Chocolate")
                                Text("Vanilla").tag("Vanilla")
                                Text("Strawberry").tag("Strawberry")
                            }
                            .foregroundStyle(.black)
                            .pickerStyle(.menu)
                        }
                        
                        .listRowBackground(Color.white)
                        
                    }
                    Section (header:
                                Text("Title")
                        .foregroundColor(Color.white)
                    ) {
                        TextField("", text: typeOfNotebook == "New" ?  $titleForNew : $title)
                            .foregroundColor(Color.black)
                    }
                    .listRowBackground(Color.white)
                    
                    Section (header:
                                Text("Write your story")
                        .foregroundColor(Color.white)
                    ) {
                        TextEditor(text: typeOfNotebook == "New" ?  $textForNew : $text)
                            .frame(minHeight: typeOfNotebook == "New" ? UIScreen.main.bounds.height / 4 : UIScreen.main
                                .bounds.height / 8 )
                            .foregroundColor(Color.black)
                        
                    }
                    .listRowBackground(Color.white)
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
                .clipShape(.rect(cornerRadius: 44))
            }
            .background(Color.black)
            .onAppear {
                // code to come
            }
            .navigationTitle("Write")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                HStack {
                    PhotosPicker(selection: $photoPickerManager.imagesSelection, matching: .images) {
                        HStack {
                            Image(systemName: "photo.on.rectangle")
                                .foregroundStyle(.orange)
                        }
                    }
                    Button {
                        print(photoPickerManager.selectedImages)
                        print(type(of: photoPickerManager.selectedImages))
                        notebookManager.addNotebookToDB(notebook: NotebookModel(
                            notebookTitle: "",
                            allJournalEntries: [JournalEntryModel(title: "test", entry: "sdsdsdf", date: Date.now, images: ["image 1"])]))
                        openSheet.toggle()
                    } label: {
                        Image(systemName: "folder.fill.badge.plus")
                            .foregroundStyle(.orange)
                    }
                }
            }
        }
        .sheet(isPresented: $openSheet) {
            SendJournalNotes()
                .toolbar {
                    
                }
                .presentationDetents([.height(80)])
        }
    }
}

#Preview {
    WriteMainView()
}


