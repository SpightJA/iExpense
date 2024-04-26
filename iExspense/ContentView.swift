//
//  ContentView.swift
//  iExspense
//
//  Created by Jon Spight on 4/19/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
            Spacer()
            Button("Color Change"){
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .red : .blue)
            .animation(nil, value: enabled)
            .foregroundColor(.white)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0 ))
            .animation(.spring(duration: 1, bounce: 0.6), value: enabled)

            Spacer()
            
            Button("Tap Me") {
//                animationAmount += 1
                withAnimation (.spring(duration: 1, bounce: 0.5)){
                    animationAmount += 360
                }
                
            }
            .padding(40)
            .background(.red)
            .foregroundStyle(.white)
            .clipShape(.circle)
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0.0, y: 1.0, z: 0.0))
            
            
        }
    }
}

#Preview {
    ContentView()
}
