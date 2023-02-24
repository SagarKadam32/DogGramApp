//
//  CarouselView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        TabView(selection: .constant(1)) {
            Text("Tab-1")
                .tabItem {
                    Text("Tab 1")
                }
                .tag(1)
            
            Text("Tab-2")
                .tabItem {
                    Text("Tab 2")
                }
                .tag(2)
            
        }
        .tabViewStyle(PageTabViewStyle())
        .background(Color.red)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
