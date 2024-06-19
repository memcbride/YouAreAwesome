//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Mark McBride on 6/16/24.
//  Last Update by Mark McBride on 6/17/24.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString  = ""
    @State private var lastMessageNumber = -1
    @State private var imageName = ""
    @State private var lastImageNumber = -1
    @State private var soundName = ""
    @State private var lastSoundNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        VStack {
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            Spacer()
            
            Button("Show Message") {
                let messages = ["You Are Awesome!",
                                "You Are Great!",
                                "Fabulous? That's You!",
                                "You Are Fantastic!",
                                "You Are Swifty"]
                var messageNumber: Int
                repeat {
                    messageNumber = Int.random(in: 0...messages.count-1)
                } while lastMessageNumber == messageNumber
                lastMessageNumber = messageNumber
                messageString = messages[messageNumber]
                
                var imageNumber: Int
                repeat {
                    imageNumber = Int.random(in: 0...9)
                } while lastImageNumber == imageNumber
                lastImageNumber = imageNumber
                imageName = "image\(imageNumber)"
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...5)
                } while lastSoundNumber == soundNumber
                lastSoundNumber = soundNumber
                soundName = "sound\(soundNumber)"

                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Could not read file named \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print(" Error: \(error.localizedDescription) creating audioPlayer.")
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
