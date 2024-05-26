//
//  IpaScannerApp.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 24.05.2024.
//

import SwiftUI

@main
struct IpaScannerApp: App {
    
    let dependencies = ApplicationDependencies()
    
    @StateObject
    var navigationContext = NavigationContext()
    
    var body: some Scene {
        WindowGroup {
            NavigationContainer(
                pageBuilder: ModulePageBuilder(dependencies: dependencies),
                navigationContext: navigationContext,
                root: MainModulePage.selectFile
            )
        }
        .windowResizability(.contentMinSize)
    }
    
}
