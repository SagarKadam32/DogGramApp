//
//  LikeAnimationView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 02/03/23.
//

import SwiftUI

struct LikeAnimationView: View {
    @State var animate: Bool = false
    var body: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .foregroundColor(.red.opacity(0.3))
                .font(.system(size: 200))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.3)
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red.opacity(0.6))
                .font(.system(size: 150))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.4)

            Image(systemName: "heart.fill")
                .foregroundColor(.red.opacity(0.9))
                .font(.system(size: 100))
                .opacity(animate ? 1.0 : 0.0)
                .scaleEffect(animate ? 1.0 : 0.5)

        }
        .animation(Animation.easeInOut(duration: 0.5).repeatForever())
        .onAppear() {
            animate.toggle()
        }
    }
}

struct LikeAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        LikeAnimationView()
            .previewLayout(.sizeThatFits)
    }
}
