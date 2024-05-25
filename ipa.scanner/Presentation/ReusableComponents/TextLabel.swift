//
//  TextLabel.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import SwiftUI

struct TextLabel: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 18))
            .foregroundStyle(.black)
    }
    
}

#Preview {
    ZStack {
        TextLabel(text: "Hello")
    }
    .frame(width: 300, height: 300, alignment: .center)
}
