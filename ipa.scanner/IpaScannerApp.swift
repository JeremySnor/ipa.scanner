//
//  IpaScannerApp.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import SwiftUI

@main
struct IpaScannerApp: App {
    
    @StateObject
    var navigationContext = NavigationContext()
    
    var body: some Scene {
        WindowGroup {
            NavigationContainer(
                pageBuilder: ModulePageBuilder.self,
                navigationContext: navigationContext,
                root: MainModulePage.selectFile
            )
            .frame(width: 1366, height: 768, alignment: .center)
        }
        .windowResizability(.contentMinSize)
    }
    
}
