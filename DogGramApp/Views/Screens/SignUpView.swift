//
//  SignUpView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 28/02/23.
//

import SwiftUI

struct SignUpView: View {
    @State var showOnboardingView: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Spacer()
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100, alignment: .center)
            
            Text("You're not Signed In! 😔")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.purpuleColor)
            
            Text("Click the button below to create an account and join the fun!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
            Button(action: {
                showOnboardingView.toggle()
            }, label: {
                Text("Sign In/ Sign Up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth:.infinity)
                    .frame(height:60)
                    .background(Color.MyTheme.purpuleColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
            .accentColor(Color.MyTheme.yellowColor)
            
             Spacer()
             Spacer()
        }
        .padding(.all, 40)
        .background(Color.MyTheme.yellowColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingView, content: {
            OnboardingView()
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
