//
//  NotebookViewModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore


class NotebookViewModel : ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var notebooks : [NotebookModel] = []
//    @Published var notebook : NotebookModel = NotebookModel(
//        id: "92349",
//        notebookTitle: "Title",
//        allJournalEntries: [
//                JournalEntryModel(title: "London Trip", entry: "Very very long long text", date: Date.now),
//                JournalEntryModel(title: "Daily", entry: "Very very long long text", date: Date.now),
//                JournalEntryModel(title: "Work Diaries", entry: "Very very long long text", date: Date.now),
//                JournalEntryModel(title: "My Hobies", entry: "Very very long long text", date: Date.now),
//                JournalEntryModel(title: "Coding Journey", entry: "Very very long long text", date: Date.now)
//           ])
//    
    
    
 
    func addJournalEntry(title : String, text : String, date : Date, images : String) {
        let newEntry = JournalEntryModel(title: title, entry: text, date: date, images: [images])
        notebooks[0].allJournalEntries.append(newEntry)
    }
    
    
    func addNotebookToDB(notebook : NotebookModel) {
        do {
            let _ = try db.collection("notebooks").addDocument(from: notebook)
        } catch {
            print("Error adding expense: \(error)")
        }
    }
}
