//
//  PostView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct PostView: View {
    
    @State var post: PostModel
    @State var animateLike: Bool = false
    @State var addHeartAnimationToView: Bool
    
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
            ZStack {
                Image("dog1")
                    .resizable()
                    .scaledToFit()
                
                if addHeartAnimationToView {
                    LikeAnimationView(animate: $animateLike)
                }
            }

            
            // MARK: FOOTER
            if showHeaderAndFooter {
                HStack(alignment: .center, spacing: 20) {
                    Button(action: {
                        if post.likedByUser {
                            // Unlike
                            unlikePost()
                        }else {
                            // Like
                            likePost()
                        }
                        
                    }, label: {
                        Image(systemName: post.likedByUser ? "heart.fill" : "heart")
                            .font(.title3)
                    })
                    .accentColor(post.likedByUser ? .red : .primary)
                    
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
    
    
    // MARK: FUNCTIONS
    
    func likePost() {
        // Update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, userName: post.userName, dataCreated: post.dataCreated, likeCount: post.likeCount + 1, likedByUser: true)
        self.post = updatedPost
        
        animateLike = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            animateLike = false
        }
    }
    
    func unlikePost() {
        // Update the local data
        let updatedPost = PostModel(postID: post.postID, userID: post.userID, userName: post.userName, dataCreated: post.dataCreated, likeCount: post.likeCount - 1, likedByUser: false)
        self.post = updatedPost
    }
}

struct PostView_Previews: PreviewProvider {
    static var post = PostModel(postID: "", userID: "", userName: "Sagar Kadam", capption: "This is a test caption", dataCreated: Date(), likeCount: 0, likedByUser: false)
    static var previews: some View {
        PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
