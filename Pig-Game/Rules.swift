//
//  Rules.swift
//  Pig-Game
//
//  Created by Alex Anderson on 11/3/22.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        ZStack{
            Color.blue.opacity(0.5).ignoresSafeArea()
            VStack{
                Text("How to Play PIG").font(.system(size:30)).fontWeight(.heavy)
                VStack{
                    Text("1. Tap the dice when the phone is passed to you.").padding()
                    Text("2. Whatever the Dice lands on is how many points can be added to the total").padding()
                    Text("3. You can choose to 'Hold' and add the points to the total ").padding()
                    Text("4. Or you can keep rolling and accumulating points.").padding()
                    Text("5. If you roll a 'Pig' all points accumulated that turn are lost and it is the next persons turn").padding()
                    Text("6. Whoever is able to get the total points to 100+ on their turn is the winner").padding()
                }
               
                .padding()
            }
        }
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        Rules()
    }
}
