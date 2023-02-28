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
                    
                    NavigationLink(destination: {
                        SettingsEditTextView(submissionText: "Current Display Name", title: "Display Name", description: "You can edit your display name here. This will be seen by other users on your profile and on your posts! ", placeholder: "Your display name here...")
                    }, label: {
                        SettingsRowView(leftIcon: "pencil", text: "Display Name", color: Color.MyTheme.purpuleColor)
                    })
      
                    NavigationLink(destination: {
                        SettingsEditTextView(submissionText: "Current Bio here", title: "Profile Bio", description: "Your bio is a great place to let other users know a little about you. It will be shown on your profile only.", placeholder: "Your Bio here...")
                    }, label: {
                        SettingsRowView(leftIcon: "text.quote", text: "Bio", color: Color.MyTheme.purpuleColor)
                    })
                    
                    NavigationLink(destination: {
                        SettingsEditImageView(title: "Profile Picture", description: "Your profile picture will be shown on your profile and your posts. Most user make it an image of themselves or of their dog!", selectedImage: UIImage(named: "dog1")!)
                    }, label: {
                        SettingsRowView(leftIcon: "photo", text: "Profile Picture", color: Color.MyTheme.purpuleColor)
                    })

                    
                    SettingsRowView(leftIcon: "figure.walk", text: "Sign Out", color: Color.MyTheme.purpuleColor)
                    
                }, label: {
                    SettingsLabelView(labelText: "Profile", labelImage: "person.fill")
                    
                })
                .padding()
                
                // MARK: SECTION-3: APPLICATION
                GroupBox(content: {
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.google.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Privacy Policy", color: Color.MyTheme.yellowColor)
                    })
                    
                    Button(action: {
                        openCustomURL(urlString: "https://www.yahoo.com")
                    }, label: {
                        SettingsRowView(leftIcon: "folder.fill", text: "Terms and Conditions", color: Color.MyTheme.yellowColor)
                    })
  
                    Button(action: {
                        openCustomURL(urlString: "https://www.bing.com")
                    }, label: {
                        SettingsRowView(leftIcon: "globe", text: "DogGram Website", color: Color.MyTheme.yellowColor)
                    })
                  
                }, label: {
                    SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                })
                .padding()
                
                // MARK: SECTION-4 SIGN OFF
                GroupBox {
                    Text("DogGram was made with love. \n All Rights Reserved \n Cool App Inc. \n Copyright 2023 ❤️")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                .padding(.bottom, 80)
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
    
    // MARK: FUNCTIONS
    
    func openCustomURL(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
