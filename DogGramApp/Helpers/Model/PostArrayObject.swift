//
//  PostArrayObject.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import Foundation

class PostArrayObject: ObservableObject {
    
    @Published var dataArray = [PostModel]()
    
    init() {
        print("FETCH POST FROM DATABASE")
        
        let post1 = PostModel(postID: "", userID: "", userName: "Sagar Kadam", capption: "This is test caption", dataCreated: Date(), likeCount: 0, likedByUser: false)
        let post2 = PostModel(postID: "", userID: "", userName: "Shravani", capption: nil, dataCreated: Date(), likeCount: 0, likedByUser: false)
        let post3 = PostModel(postID: "", userID: "", userName: "Shreyasi", capption: "Awesome Caption", dataCreated: Date(), likeCount: 0, likedByUser: false)
        let post4 = PostModel(postID: "", userID: "", userName: "Snehal", capption: nil, dataCreated: Date(), likeCount: 0, likedByUser: false)
        
        dataArray.append(post1)
        dataArray.append(post2)
        dataArray.append(post3)
        dataArray.append(post4)
    }
    
    /// USED FOR SINGLE POST SELECTION
    init(post : PostModel) {
        self.dataArray.append(post)
    }
}
