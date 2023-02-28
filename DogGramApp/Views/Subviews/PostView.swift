//
//  PostView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    var showHeaderAndFooter: Bool
     
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            
            // MARK: HEADER
            if showHeaderAndFooter {
                HStack {
                    NavigationLink(destination: {
                        ProfileView(profileDisplayName: post.userName, showSettings: false, isMyProfile: false,  profileUserID: post.userID)
                    }, label: {
                        Image("dog1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30, alignment: .center)
                        .cornerRadius(15)
                        
                        Text(post.userName)
                            .font(.callout)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    })
                    
                    Spacer()
                    Image(systemName: "ellipsis")
                        .font(.headline)
                }
                .padding(.all, 6)
            }

            
            // MARK: IMAGE
            Image("dog1")
                .resizable()
                .scaledToFit()
            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Image(systemName: "heart")
                        .font(.title3)
                    
                    NavigationLink(destination: {
                        CommentsView()
                    },
                                   label: {
                        Image(systemName: "bubble.middle.bottom")
                            .font(.title3)
                            .foregroundColor(.primary)
                    })

                    
                    Image(systemName: "paperplane")
                        .font(.title3)
                }
                .padding(.all, 6)
                
                if let caption = post.capption {
                    HStack {
                        Text(caption)
                        Spacer(minLength: 0)
                    }
                    .padding(.all, 6)
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var post = PostModel(postID: "", userID: "", userName: "Sagar Kadam", capption: "This is a test caption", dataCreated: Date(), likeCount: 0, likedByUser: false)
    static var previews: some View {
        PostView(post: post, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
