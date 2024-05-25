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
    var loading: Binding<Bool>? = nil
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .buttonStyle(
                PrimaryButtonStyle(
                    idealWidth: idealWidth,
                    loading: loading
                )
            )
            .disabled(loading?.wrappedValue == true)
    }
    
}

struct PrimaryButtonStyle: ButtonStyle {
    
    let idealWidth: CGFloat
    var loading: Binding<Bool>?
    
    func makeBody(configuration: Configuration) -> some View {
        content(configuration: configuration)
            .padding(.horizontal, 14)
            .frame(maxWidth: idealWidth)
            .frame(height: 40)
            .background(Color.blue.opacity(configuration.isPressed ? 0.8 : 1.0))
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
    
    @ViewBuilder
    private func content(configuration: Configuration) -> some View {
        if let loading, loading.wrappedValue {
            ProgressView()
                .controlSize(.small)
                .colorInvert()
                .brightness(1)
        } else {
            configuration.label
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(.white)
        }
    }
    
}

#Preview {
    VStack {
        PrimaryButton(
            title: "Continue",
            action: { }
        )
        
        PrimaryButton(
            title: "Continue",
            loading: .constant(true),
            action: { }
        )
    }
    .frame(width: 300, height: 300, alignment: .center)
}
