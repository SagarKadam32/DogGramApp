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
                Text("Test")
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
