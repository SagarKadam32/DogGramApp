//
//  CarouselView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 24/02/23.
//

import SwiftUI

struct CarouselView: View {
    
    @State var selection: Int = 1
    var body: some View {
        
        TabView(selection: $selection, content: {
            ForEach(1..<8) { count in
                Image("dog\(count)")
                    .resizable()
                    .scaledToFill()
                    .tag(count)
            }
        })
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
