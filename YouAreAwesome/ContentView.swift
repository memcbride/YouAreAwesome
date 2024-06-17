//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Mark McBride on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString  = " "
    var body: some View {
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.red)
                .italic()
            HStack {
                Button("Awesome") {
                    messageString = "You Are Awesome"
                }
                .buttonStyle(.borderedProminent)
                
                Button("Great") {
                    messageString = "You Are Great"
                }
                .buttonStyle(.borderedProminent)
            }
        }
            .padding()
        }
    }
    
    #Preview {
        ContentView()
    }
