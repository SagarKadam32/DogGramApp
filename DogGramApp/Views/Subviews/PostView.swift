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
    @State var showActionSheet: Bool = false
    @State var actionSheetType: PostActionSheetActionOption = .general
    @State var postImage: UIImage = UIImage(named: "dog1")!
    
    var showHeaderAndFooter: Bool
    
    enum PostActionSheetActionOption {
        case general
        case reporting
    }
     
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
                    
                    Button(action: {
                        showActionSheet.toggle()
                        
                    }, label: {
                        Image(systemName: "ellipsis")
                            .font(.headline)
                    })
                    .actionSheet(isPresented: $showActionSheet, content: {
                        getActionSheet()
                    })
                    .accentColor(.primary)

                }
                .padding(.all, 6)
            }

            
            // MARK: IMAGE
            ZStack {
                Image(uiImage: postImage)
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

                    
                    Button(action: {
                        sharePost()
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.title3)
                    })
                    .accentColor(.primary)
                    
     
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
    
    func getActionSheet() -> ActionSheet {
        
        switch actionSheetType {
        case .general:
            return ActionSheet(title: Text("What would you like to do?"), message: nil, buttons: [
                .destructive(Text("Report"), action: {
                    print("REPORT")
                    self.actionSheetType = .reporting
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        self.showActionSheet.toggle()
                    }
                }),
                .default(Text("Learn More.."), action: {
                    print("LEARN MORE PRESSED")
                }),
                .cancel()
            ])
        case .reporting:
            return ActionSheet(title: Text("Why are you reporting this post?"), message: nil, buttons: [
                .destructive(Text("This is inapproprate"), action: {
                    reportPost(reason: "This is inapproprate")
                }),
                .destructive(Text("This is Spam"), action: {
                    reportPost(reason: "This is Spam")
                }),
                .destructive(Text("It made me uncomfortable"), action: {
                    reportPost(reason: "It made me uncomfortable")
                }),
                .cancel({
                    self.actionSheetType = .general
                })
            ])
        }
        
        

    }
    
    func reportPost(reason: String) {
        print("Report Post Now..")
        self.actionSheetType = .general
    }
    
    func sharePost() {
        let message = "Check out this post on Doggram!"
        let image = postImage
        let link = URL(string: "https://www.google.com")!
        
        let activityController = UIActivityViewController(activityItems: [message, image, link], applicationActivities: nil)
        
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityController, animated: true, completion: nil)
    }
}

struct PostView_Previews: PreviewProvider {
    static var post = PostModel(postID: "", userID: "", userName: "Sagar Kadam", capption: "This is a test caption", dataCreated: Date(), likeCount: 0, likedByUser: false)
    static var previews: some View {
        PostView(post: post, addHeartAnimationToView: true, showHeaderAndFooter: true)
            .previewLayout(.sizeThatFits)
    }
}
