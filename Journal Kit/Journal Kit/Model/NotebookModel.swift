//
//  NotebookModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import Foundation


struct NotebookModel : Identifiable, Codable  {
    var id = UUID()
    var notebookTitle : String
    var allJournalEntries : [JournalEntryModel] = []
        
}
