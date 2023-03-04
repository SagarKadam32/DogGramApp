//
//  ProfileView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 26/02/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var profileDisplayName: String
    @State var showSettings: Bool
    
    var isMyProfile: Bool
    var profileUserID: String
    
    var posts = PostArrayObject()
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView(profileDisplayName: $profileDisplayName)
            Divider()
            ImageGridView(posts: posts)
        })
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                    Button(
                        action: {
                            showSettings.toggle()
                        },
                        label: {
                            Image(systemName: "line.horizontal.3")
            
                    })
                    .accentColor(colorScheme == .light ? Color.MyTheme.purpuleColor : Color.MyTheme.yellowColor)
                    .opacity(isMyProfile ? 1.0 : 0.0)
            
        )
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .preferredColorScheme(colorScheme)
                .accentColor(colorScheme == .light ? Color.MyTheme.purpuleColor : Color.MyTheme.yellowColor)
        }

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView(profileDisplayName: "My Profile", showSettings: false, isMyProfile: true, profileUserID: "")
                .preferredColorScheme(.dark)
        }
    }
}
