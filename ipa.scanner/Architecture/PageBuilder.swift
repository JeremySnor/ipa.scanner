//
//  PageBuilder.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 25.05.2024.
//

import SwiftUI

typealias PageView = AnyView

extension View {
    
    func asPageView() -> PageView {
        PageView(self)
    }
    
}

protocol PageBuilder {
    
    static func destinationFor(
        page: Page, 
        navigationContext: NavigationContext
    ) -> PageView
    
}
