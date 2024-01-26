//
//  NotebookModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import Foundation


class NotebookModel : Identifiable, Codable  {
    var id : String
    var allJournalEntries : [JournalEntryModel] = []
}
