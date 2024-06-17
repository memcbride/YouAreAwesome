//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Mark McBride on 6/16/24.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString  = ""
    var body: some View {
        VStack {
            Spacer()
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            //                .border(.orange, width: 1)
            
            Spacer()
            
            HStack {
                Button("Awesome") {
                    messageString = "You Are Awesome"
                }
                .buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Great") {
                    messageString = "You Are Great"
                }
                .buttonStyle(.borderedProminent)
            }
            //            .border(.purple, width: 5)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
