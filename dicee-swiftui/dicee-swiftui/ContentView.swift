//
//  ContentView.swift
//  dicee-swiftui
//
//  Created by Ekambeer Singh on 30/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 2
    fileprivate func DiceView(_ dice: Int) -> some View {
        return Image("dice\(dice)").resizable().aspectRatio(1, contentMode: .fit).padding()
    }
    
    var body: some View {
        ZStack {
            Image("background").resizable().edgesIgnoringSafeArea(.all)
            VStack() {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(self.leftDiceNumber)
                    DiceView(self.rightDiceNumber)
                }.padding(.horizontal, 40)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6);
                    self.rightDiceNumber = Int.random(in: 1...6);
                }) {
                    Text("Roll").foregroundColor(.white).font(.title)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .fontWeight(.heavy)
                }.background(.red)
                Spacer()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
