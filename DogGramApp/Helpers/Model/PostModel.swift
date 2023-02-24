//
//  PostModel.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    
    var id = UUID()
    var postID: String // ID for the post in database
    var userID: String // ID for the user in database
    var userName: String // Username of user in database
    var capption: String?
    var dataCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    
}
