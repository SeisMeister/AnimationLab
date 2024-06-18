//
//  ContentView.swift
//  Animation-Lab
//
//  Created by Cesar Fernandez on 6/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countDownText: String = "3"
    @State private var scale: CGFloat = 8.0
    @State private var shrinkScale: CGFloat = 1.0
    @State private var scaleDuration: TimeInterval = 0.75
    @State private var opacityDuration: TimeInterval = 0.5
    @State private var symbolColor: Color = .white
    @State private var opacity: Double = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Text(countDownText)
                .foregroundColor(symbolColor)
                .transition(.opacity)
                .font(.largeTitle)
                .scaleEffect(scale)
                .opacity(opacity)
                .onAppear {
                    startCountDown()
                }
            Spacer()
            Button("Start Game") {
                startCountDown()
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(.black)
    }
    
    func startCountDown() {
        scale = 5.0
        countDownText = "3"
        opacity = 0.0
        
        withAnimation(Animation.easeInOut(duration: scaleDuration)) {
            scale = shrinkScale
        }
        withAnimation(Animation.easeInOut(duration: opacityDuration)) {
            opacity = 1.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + scaleDuration) {
            countDownText = "2"
            scale = 5.0
            opacity = 0.0
            
            withAnimation(Animation.easeInOut(duration: scaleDuration)) {
                scale = shrinkScale
            }
            withAnimation(Animation.easeInOut(duration: opacityDuration)) {
                opacity = 1.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + scaleDuration) {
                countDownText = "1"
                scale = 5.0
                opacity = 0.0
                
                withAnimation(Animation.easeInOut(duration: scaleDuration)) {
                    scale = shrinkScale
                }
                withAnimation(Animation.easeInOut(duration: opacityDuration)) {
                    opacity = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + scaleDuration) {
                    countDownText = "Go!"
                    scale = 5.0
                    opacity = 1.0
                    
                    withAnimation(Animation.easeInOut(duration: scaleDuration)) {
                        scale = shrinkScale
                    }
                    withAnimation(Animation.easeInOut(duration: opacityDuration)) {
                        opacity = 1.0
                    }
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}

