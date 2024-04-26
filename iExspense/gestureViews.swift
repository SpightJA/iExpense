//
//  gestureViews.swift
//  iExspense
//
//  Created by Jon Spight on 4/19/24.
//

import SwiftUI

struct gestureViews: View {
    @State private var dragAmount = CGSize.zero
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    
    var  body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count, id: \.self) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
    
}

#Preview {
    gestureViews()
}
