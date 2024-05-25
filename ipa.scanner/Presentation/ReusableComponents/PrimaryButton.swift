//
//  PrimaryButton.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import SwiftUI

struct PrimaryButton: View {
    
    let title: String
    var idealWidth: CGFloat = 100
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .buttonStyle(PrimaryButtonStyle(idealWidth: idealWidth))
    }
    
}

struct PrimaryButtonStyle: ButtonStyle {
    
    let idealWidth: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 14, weight: .medium))
            .foregroundStyle(.white)
            .padding(.horizontal, 14)
            .frame(maxWidth: idealWidth)
            .frame(height: 40)
            .background(Color.blue.opacity(configuration.isPressed ? 0.8 : 1.0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
}

#Preview {
    ZStack {
        PrimaryButton(
            title: "Continue",
            action: { }
        )
        .fixedSize()
    }
    .frame(width: 300, height: 300, alignment: .center)
}
