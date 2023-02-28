//
//  ContentView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 23/02/23.
//

import SwiftUI

struct ContentView: View {
    var currentUserID: String? = nil
    var body: some View {
    
        TabView {
            NavigationView {
                FeedView(post: PostArrayObject(), title: "Feed View")
            }.tabItem {
                Image(systemName: "book.fill")
                Text("Feed")
            }
         
            NavigationView {
                BrowseView()
            }.tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            
            UploadView()
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            
            ZStack {
                if currentUserID != nil {
                    NavigationView{
                        ProfileView(profileDisplayName: "My Profile", showSettings: false, isMyProfile: true, profileUserID: "")
                    }
                }else {
                    SignUpView()
                }
   
            }.tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color.MyTheme.purpuleColor)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
