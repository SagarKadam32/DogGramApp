//
//  ImageGridView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 26/02/23.
//

import SwiftUI

struct ImageGridView: View {
    @ObservedObject var posts: PostArrayObject
    var body: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())],
            alignment: .center,
            spacing: nil,
            pinnedViews: []) {
                ForEach(posts.dataArray, id: \.self) { post in
                    NavigationLink(destination: {
                        FeedView(post: PostArrayObject(post: post))
                    }, label: {
                        PostView(post: post, showHeaderAndFooter: false)
                    })
                  }
            }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView(posts: PostArrayObject())
            .previewLayout(.sizeThatFits)
    }
}
