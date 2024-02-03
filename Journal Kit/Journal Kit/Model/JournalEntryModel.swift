//
//  JournalEntryModel.swift
//  Journal Kit
//
//  Created by Vinter Marco on 24.01.2024.
//

import Foundation
import UIKit


struct JournalEntryModel : Identifiable, Codable  {
    var id = UUID()
    var title : String
    var entry : String
    var date : Date
    var images : [String?]
    
}
