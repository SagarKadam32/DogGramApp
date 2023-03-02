//
//  FeedView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var post : PostArrayObject
    var title: String
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(post.dataArray, id: \.self) { post in
                    PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
                }
            }
        }
        .navigationBarTitle(title)
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView(post: PostArrayObject(), title: "Feed View")
        }
    }
}
