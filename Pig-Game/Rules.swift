//
//  Rules.swift
//  Pig-Game
//
//  Created by Alex Anderson on 11/3/22.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        VStack{
            Text("How to Play PIG").font(.system(size:30)).fontWeight(.heavy)
            VStack{
                
                Text("Mechanics:").font(.system(size:25)).fontWeight(.heavy).padding()
                Text("1. Add a player by tapping the add player button").font(.system(size:15)).fontWeight(.heavy).padding()
                Text("2. Roll The Dice by tapping on it").font(.system(size:15)).fontWeight(.heavy).padding()
                Text("3. Hold Your points by tapping the Hold Button").font(.system(size:15)).fontWeight(.heavy).padding()
            }
            VStack{
                Text("Rules:").font(.system(size:25)).fontWeight(.heavy)
                    .padding()
                Text("1. Each Player Rolls The Die on their turn to accumulate points").font(.system(size:15)).fontWeight(.heavy).padding()
                Text("2. The player can end their turn by either keeping their points via the hold button OR by rolling a one and losing all accumulated points on that turn ").font(.system(size:15)).fontWeight(.heavy).padding()
                Text("3. Once a Player has accumulate 100+ points they have won the game").font(.system(size:15)).fontWeight(.heavy).padding()
            }
            .padding()
        }
    }
}

struct Rules_Previews: PreviewProvider {
    static var previews: some View {
        Rules()
    }
}
