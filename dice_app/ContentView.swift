//
//  ContentView.swift
//  dice_app
//
//  Created by Kumar Aman on 11/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    @State var isButtonPressed = false
    
    var body: some View {
        ZStack{
            Color(red: 1.00, green: 0.54, blue: 0.40)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                Spacer()
                Button(action: {
                    isButtonPressed = true
                    withAnimation {
                        leftDiceNumber = Int.random(in: 1...6)
                        rightDiceNumber = Int.random(in: 1...6)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                            withAnimation {
                                                isButtonPressed = false
                                            }
                                        }
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }.background(Color(red: 0.91, green: 0.30, blue: 0.24))
                    .cornerRadius(20)
            }
            .padding(.horizontal)
        }
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(40)
            .padding()
            .rotation3DEffect(
                            .degrees(Double(n) * 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                        .animation(.easeInOut(duration: 0.5), value: n)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


