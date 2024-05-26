//
//  CardViewModifier.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import SwiftUI

struct CardViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .shadow(
                color: .black.opacity(0.08),
                radius: 8
            )
    }
    
}

extension View {
    
    func asCardView() -> some View {
        modifier(CardViewModifier())
    }
    
}
