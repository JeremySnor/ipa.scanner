//
//  NavigationContainer.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import Foundation
import SwiftUI

struct NavigationContainer<PB: PageBuilder>: View {
    
    let pageBuilder: PB
    
    @ObservedObject
    var navigationContext: NavigationContext
    
    @ViewBuilder
    let root: PB.PAGE
    
    init(
        pageBuilder: PB,
        navigationContext: NavigationContext,
        root: PB.PAGE
    ) {
        self.pageBuilder = pageBuilder
        self.navigationContext = navigationContext
        self.root = root
    }
    
    var body: some View {
        NavigationStack(path: $navigationContext.pages) {
            pageBuilder.destinationFor(
                page: root,
                navigationContext: navigationContext
            )
            .navigationDestination(
                for: PB.PAGE.self,
                destination: { page in
                    pageBuilder.destinationFor(
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
