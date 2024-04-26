//
//  SecondView.swift
//  iExspense
//
//  Created by Jon Spight on 4/20/24.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Hello this is the second view")
            Button("Dismiss"){
                dismiss()
            } 
        }
    }
}

#Preview {
    SecondView()
}
