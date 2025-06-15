//
//  ViewForDetail.swift
//  iOSSample
//
//  Created by praveen hiremath on 11/06/25.
//

import SwiftUI

import SwiftUI
import AVFoundation

struct ViewForDetail: View {
    @State private var currentIndex = 0
    @State private var yOffset: CGFloat = -200
    @State private var isVisible = false

    let letters = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    let synthesizer = AVSpeechSynthesizer()

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            VStack {
        
                if isVisible {
                    Text(String(letters[currentIndex]))
                        .font(.system(size: 120, weight: .bold))
                        .foregroundColor(.blue)
                        .offset(y: yOffset)
                        .transition(.opacity.combined(with: .offset(y: -100)))
                        .onAppear {
                            // Drop animation
                            withAnimation(.easeOut(duration: 1.0)) {
                                yOffset = 0
                            }

                            // Speak the letter
                            speakLetter(String(letters[currentIndex]))
                        }
                }
          
            }
            .onAppear {
                showNextLetter()
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Letter View") // Title in NavBar
                   .navigationBarTitleDisplayMode(.inline) // Optional: makes it compact
        }
     
        
    }

    func showNextLetter() {
        guard currentIndex < letters.count else { return }

        yOffset = -200
        isVisible = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation {
                isVisible = false
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                currentIndex += 1
                if currentIndex < letters.count {
                    showNextLetter()
                }
            }
        }
    }

    func speakLetter(_ letter: String) {
        let utterance = AVSpeechUtterance(string: letter.lowercased())
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.1
        synthesizer.speak(utterance)
    }
}

#Preview {
    ViewForDetail()
}
