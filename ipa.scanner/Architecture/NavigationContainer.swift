//
//  NavigationContainer.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import Foundation
import SwiftUI

struct NavigationContainer<PB: PageBuilder>: View {
    
    @ObservedObject
    var navigationContext: NavigationContext
    
    @ViewBuilder
    let root: Page
    
    init(
        pageBuilder: PB.Type,
        navigationContext: NavigationContext,
        root: Page
    ) {
        self.navigationContext = navigationContext
        self.root = root
    }
    
    var body: some View {
        NavigationStack(path: $navigationContext.pages) {
            PB.destinationFor(
                page: root,
                navigationContext: navigationContext
            )
            .navigationDestination(
                for: Page.self,
                destination: { page in
                    PB.destinationFor(
                        page: page,
                        navigationContext: navigationContext
                    )
                }
            )
            .alert(
                "Ошибка",
                isPresented: $navigationContext.isErrorPresented,
                presenting: navigationContext.error,
                actions: { _ in
                    Button(
                        "Хорошо",
                        action: { navigationContext.hideError() }
                    )
                },
                message: { error in
                    Text(error.localizedDescription)
                }
            )
        }
    }
    
}
