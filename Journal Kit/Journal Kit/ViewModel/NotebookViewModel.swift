//
//  NotebookViewModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import Foundation


class NotebookViewModel : ObservableObject {
    
    @Published var notebook : [JournalEntryModel] = [
        JournalEntryModel(title: "London Trip", entry: "Very very long long text", date: Date.now),
        JournalEntryModel(title: "Daily", entry: "Very very long long text", date: Date.now),
        JournalEntryModel(title: "Work Diaries", entry: "Very very long long text", date: Date.now),
        JournalEntryModel(title: "My Hobies", entry: "Very very long long text", date: Date.now),
        JournalEntryModel(title: "Coding Journey", entry: "Very very long long text", date: Date.now),
    ]
    
    
 
    func addJournalEntry(title : String, text : String, date : Date) {
        let newEntry = JournalEntryModel(title: title, entry: text, date: date)
        notebook.append(newEntry)
    }
    
}
