//
//  FeedView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            PostView()
            PostView()
            PostView()
            PostView()
        }
        .navigationBarTitle("FEED VIEW")
        .navigationBarTitleDisplayMode(.inline)

    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FeedView()
        }
    }
}
