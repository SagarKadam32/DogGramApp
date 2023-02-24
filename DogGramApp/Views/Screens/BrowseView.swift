//
//  BrowseView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct BrowseView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            CarouselView()
        }
        .navigationBarTitle("Browse")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BrowseView()
        }
    }
}
