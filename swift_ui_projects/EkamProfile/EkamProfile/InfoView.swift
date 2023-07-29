//
//  InfoView.swift
//  EkamProfile
//
//  Created by Ekambeer Singh on 29/07/23.
//

import SwiftUI

struct InfoView: View {
    let text: String;
    let image: String;
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(.white)
            .frame(height: 50, alignment: .center).overlay(HStack {
                Image(systemName: self.image).foregroundColor(Color(red: 0.83, green: 0.33, blue: 0.00, opacity: 0.8))
                Text(self.text).bold()
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "text", image: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
