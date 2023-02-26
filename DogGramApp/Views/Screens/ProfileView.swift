//
//  ProfileView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 26/02/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            ProfileHeaderView()
        })
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                    Button(
                        action: {},
                        label: {
                            Image(systemName: "line.horizontal.3")
            
                    })
                    .accentColor(Color.MyTheme.purpuleColor)
        )

        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileView()
        }
    }
}
