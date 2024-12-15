//
//  RequestModel.swift
//  Movies Info
//
//  Created by Kushang  on 05/11/24.
//

import Foundation

class Notes: Codable {
    var id: Int?
    var title: String?
    var notes: String?
    var time: String?
    var image: String?
    var notesTheme: String?
    var isLiked: Bool?
    var isDeleted: Bool?
    
    init(id: Int? = nil, title: String? = nil, notes: String? = nil, time: String? = nil, image: String? = nil, notesTheme: String? = nil, isLiked: Bool? = nil, isDeleted: Bool? = nil) {
        self.id = id
        self.title = title
        self.notes = notes
        self.time = time
        self.image = image
        self.notesTheme = notesTheme
        self.isLiked = isLiked
        self.isDeleted = isDeleted
    }
}
