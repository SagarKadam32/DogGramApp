//
//  SettingsView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 27/02/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                // MARK: SECTION-1: DOGGRAM
                GroupBox(content: {
                    HStack(alignment: .center, spacing: 10) {
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(12)
                        
                        Text("DogGram is the #1 app for posting pictures of your dog and sharing them across the world. We are dog-loving community and we're happy to have you!")
                            .font(.footnote)
                    }

                }, label: {
                    SettingsLabelView(labelText: "DogGram", labelImage: "dot.radiowaves.left.and.right")

                })
                .padding()
                
                // MARK: SECTION-2: PROFILE
                GroupBox(content: {
                    
                }, label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                })
                .padding()
            }
            .navigationBarTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(leading:
                                Button(action: {
                                    presentationMode.wrappedValue.dismiss()
                                }, label: {
                                        Image(systemName: "xmark")
                                        .font(.title)
                                })
                                    .accentColor(.primary)
            )
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
