//
//  SettingsRowView.swift
//  DogGramApp
//
//  Created by Sagar Kadam on 27/02/23.
//

import SwiftUI

struct SettingsRowView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(Color.blue)
                Image(systemName: "heart.fill")
                    .font(.title3)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text("Row Title")
            Spacer()
            Image(systemName: "chevron.right")
                .font(.headline)
        }
        .padding(.vertical, 4)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView()
            .previewLayout(.sizeThatFits)
    }
}
