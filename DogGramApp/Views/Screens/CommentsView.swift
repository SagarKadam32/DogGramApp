//
//  CommentsView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct CommentsView: View {
    
    @State var submissionText: String = ""
    @State var commentsArray = [CommentsModel]()
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(commentsArray, id: \.self) { comment in
                        MessageView(comment: comment)
                    }
                }
            }
            
            HStack {
                Image("dog1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
                
                TextField("Add a comment here...", text: $submissionText)
                
                Button(action: {
                    
                }, label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                })
                .accentColor(Color.MyTheme.purpuleColor)
            }
            .padding(.all, 6)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Comments")
        .onAppear {
           getComments()
        }

    }
    
    // MARK: FUNCTIONS
    func getComments() {
       print("GET COMMENTS FROM DATABASE")
        
        let comment1 = CommentsModel(commentID: "", userID: "", userName: "Sagar Kadam", content: "This is the 1st Comment", dateCreated: Date())
        
        let comment2 = CommentsModel(commentID: "", userID: "", userName: "Shravani Kadam", content: "This is the 2nd Comment", dateCreated: Date())
        
        let comment3 = CommentsModel(commentID: "", userID: "", userName: "Snehal Kadam", content: "This is the 3rd Comment", dateCreated: Date())
        
        let comment4 = CommentsModel(commentID: "", userID: "", userName: "Shreyasi Kadam", content: "This is the 4th Comment", dateCreated: Date())
        
        self.commentsArray.append(comment1)
        self.commentsArray.append(comment2)
        self.commentsArray.append(comment3)
        self.commentsArray.append(comment4)

    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CommentsView()
        }
    }
}
