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
            
            Image("dog1")
                .resizable()
                .scaledToFill()
                .tag(0)
            
            Image("dog2")
                .resizable()
                .scaledToFill()
                .tag(1)
            
            Image("dog3")
                .resizable()
                .scaledToFill()
                .tag(3)
            
            Image("dog4")
                .resizable()
                .scaledToFill()
                .tag(4)
            
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(height:300)
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
            .previewLayout(.sizeThatFits)
    }
}
