//
//  PIG.swift
//  Pig-Game
//
//  Created by Alex Anderson on 11/3/22.
//

import SwiftUI

struct PIG: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    var body: some View {
        ZStack{
            Color.blue.opacity(0.6).ignoresSafeArea()
            VStack {
                Text("PIG THE GAME").font(.system(size:30)).fontWeight(.heavy).bold()
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
                
                Spacer()
            }
        }
    }
    func chooseRandom(times:Int) {
        if times > 0 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        randomValue = Int.random(in: 1...6)
                        chooseRandom(times: times - 1)
                    }
                }
        }
}

struct PIG_Previews: PreviewProvider {
    static var previews: some View {
        PIG()
    }
}
