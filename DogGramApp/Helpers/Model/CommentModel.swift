//
//  CommentModel.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import Foundation
import SwiftUI

struct CommentsModel : Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String // ID for Comment in the database
    var userID: String // ID for the user in the database
    var userName: String // UserName for the user in the database
    var content: String // Actual comment content text
    var dateCreated: Date
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
