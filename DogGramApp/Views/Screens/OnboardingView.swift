//
//  OnboardingView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 01/03/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack(spacing:10) {
            Image("logo.transparent")
                .resizable()
                .scaledToFit()
                .frame(width:100, height: 100, alignment: .center)
                .shadow(radius: 12)
            
            Text("Welcome to DogGrame!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.purpuleColor)
            
            
            Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are dog-loving community and we're happy to have you!")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.purpuleColor)
                .padding()
            
            Button(action: {
                
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(height:60)
                    .frame(maxWidth:.infinity)
            })
            
            Button(action: {
                
            }, label: {
                HStack {
                    Image(systemName: "globe")
                    Text("Sign In with Google")
                }
                .frame(height:60)
                .frame(maxWidth:.infinity)
                .background(Color(.init(srgbRed: 222/255, green: 82/255, blue: 70/255, alpha: 1.0)))
                .cornerRadius(6)
                .font(.system(size:23, weight: .medium, design: .default ))
            })
            .accentColor(.white)
            
            
            
        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
