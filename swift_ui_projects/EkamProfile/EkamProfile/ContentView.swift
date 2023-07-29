//
//  ContentView.swift
//  EkamProfile
//
//  Created by Ekambeer Singh on 29/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.83, green: 0.33, blue: 0.00, opacity: 0.8)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("Ekamm")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 160.0, height: 160.0)
                    .clipShape(Circle()).overlay(Circle().stroke(Color.white, lineWidth: 3.00 ))
                Text("Ekambeer Singh")
                    .font(Font.custom("DancingScript-VariableFont_wght", size: 40))
                    .bold()
                    .foregroundColor(.white)
                Text("Software Engineer")
                    .font(Font.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                Divider()
                InfoView(text: "+91 8847205368", image: "phone.fill");
                InfoView(text: "esingh0406@gmail.com", image: "envelope.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
