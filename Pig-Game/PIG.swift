//
//  PIG.swift
//  Pig-Game
//
//  Created by Alex Anderson with Custom Fonts and Button Styles from MR.B on 11/3/22.
//

import SwiftUI

struct PIG: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    @State private var turnScore = 0
    @State private var totalScore = 0
    @State private var gameOver = false
    var body: some View {
        ZStack{
            Color.brown.opacity(0.6).ignoresSafeArea()
            VStack {
                CustomText(text: "PIG THE GAME").font(.system(size:30)).fontWeight(.heavy).bold()
                    .padding()
                Image("pips \(randomValue)")
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center).rotationEffect(.degrees(rotation))
                    .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0)).padding(50)
                    .onTapGesture {
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                            rotation += 360
                        }
                    }
                CustomText(text: "Turn Score : \(turnScore)")
                HStack{
                    Button("Roll"){
                        chooseRandom(times: 3)
                        withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)){
                            rotation += 360
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                    Button("Hold"){
                        totalScore += turnScore
                        endTurn()
                        withAnimation(.easeInOut(duration: 1)){
                            rotation += 360
                        }
                        if totalScore >= 100{
                            gameOver = true
                        }
                    }
                    .buttonStyle(CustomButtonStyle())
                }
                CustomText(text: "Total Score : \(totalScore)")
                Button("Reset"){
                    endTurn()
                    totalScore = 0
                }.font(Font.custom("Marker Felt" , size: 34)).padding()
                Spacer()
            }
        }
        .alert (isPresented: $gameOver, content: {
            Alert(title: Text("You won the game!"), dismissButton:
                    .destructive(Text("Play again"), action: {
                        withAnimation (Animation.default) {
                            totalScore = 0
                            gameOver = false
                        }
                    }))
        })
        
    }
    func endTurn(){
        turnScore = 0
        randomValue = 0
    }
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
        if times == 0 {
            if randomValue == 1 {
                DispatchQueue.main.asyncAfter (deadline: .now() + 1) {
                    endTurn ()
                }
            }
            else {
                turnScore += randomValue
            }
        }
    }
}
struct PIG_Previews: PreviewProvider {
    static var previews: some View {
        PIG()
    }
}
struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width:50)
            .font(Font.custom("Marker Felt", size: 24))
            .padding()
            .background(.red).opacity(configuration.isPressed ? 0.0 : 1.0)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
struct CustomText: View {
    let text: String
    var body: some View{
        Text(text).font(Font.custom("Marker Felt", size: 36))
    }
}
