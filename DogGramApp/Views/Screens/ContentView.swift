//
//  ContentView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 23/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
        TabView {
            NavigationView {
                FeedView(post: PostArrayObject())
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
            
            Text("Screen 3")
                .tabItem {
                    Image(systemName: "square.and.arrow.up.fill")
                    Text("Upload")
                }
            
            Text("Screen 4")
                .tabItem {
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
