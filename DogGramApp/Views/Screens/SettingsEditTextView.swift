//
//  SettingsEditTextView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 28/02/23.
//

import SwiftUI

struct SettingsEditTextView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var submissionText: String = ""
    @State var title: String
    @State var description: String
    @State var placeholder: String
    var body: some View {
        VStack{
            
            HStack {
                Text(description)
                Spacer(minLength: 0)
            }
            
            TextField(placeholder, text: $submissionText)
                .padding()
                .frame(height:60)
                .frame(maxWidth:.infinity)
                .background(colorScheme == .light ? Color.MyTheme.beigeColor :  Color.MyTheme.purpuleColor)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
              
       
            Button(action: {
                
            }, label: {
                Text("Save".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height:60)
                    .frame(maxWidth:.infinity)
                    .background(colorScheme == .light ? Color.MyTheme.purpuleColor :  Color.MyTheme.yellowColor)
                    .cornerRadius(12)
            })
            .accentColor(colorScheme == .light ? Color.MyTheme.yellowColor :  Color.MyTheme.purpuleColor)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth:.infinity)
        .navigationBarTitle(title)
        
    }
}

struct SettingsEditTextView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SettingsEditTextView(title: "Edit Display Text", description: "This is the description text so that we can tell user what they are doing on this screen", placeholder: "Placholder Text")
                .preferredColorScheme(.dark)
        }
    }
}
