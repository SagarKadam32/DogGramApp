//
//  ProfileHeaderView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 26/02/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            // MARK: PROFILE PICTURE
            Image("dog1")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120, alignment: .center)
                .cornerRadius(60)
            
            // MARK: USER NAME
            Text("USER NAME HERE")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            // MARK: BIO
            Text("This is the area where we can add bio to the user profile!")
                .font(.body)
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
            
            HStack(alignment: .center, spacing: 20) {
                // MARK: POSTS
                VStack(alignment: .center, spacing: 5) {
                    Text("5")
                        .font(.title2)
                        .fontWeight(.bold )
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    
                    Text("Posts")
                        .font(.callout)
                        .fontWeight(.medium)
                }
                
                // MARK: LIKES
                VStack(alignment: .center, spacing: 5) {
                    Text("20")
                        .font(.title2)
                        .fontWeight(.bold )
                    
                    Capsule()
                        .fill(Color.gray)
                        .frame(width: 20, height: 2, alignment: .center)
                    
                    Text("Likes")
                        .font(.callout)
                        .fontWeight(.medium)
                }
            }
            
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .previewLayout(.sizeThatFits)
    }
}
