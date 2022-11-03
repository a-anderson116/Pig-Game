//
//  ContentView.swift
//  Pig-Game
//
//  Created by Alex Anderson on 11/3/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                Text("Welcome To :") .font(.system(size:30)).fontWeight(.heavy)
                Text("PIG THE GAME").font(.system(size:35)).fontWeight(.heavy)
                Spacer()
                VStack{
                    NavigationLink("Learn The Rules", destination: Rules()).font(.system(size:25)).fontWeight(.heavy)
                    Text("OR").font(.system(size:25)).fontWeight(.heavy)
                        .padding()
                    NavigationLink("Play PIG" , destination: PIG()).font(.system(size:25)).fontWeight(.heavy)
                        
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
