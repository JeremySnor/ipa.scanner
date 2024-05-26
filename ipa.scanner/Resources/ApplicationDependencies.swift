//
//  ApplicationDependencies.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class ApplicationDependencies: Dependencies {
    
    let shellService: ShellService
    let finderService: FinderService
    
    init() {
        shellService = ShellService(shellType: .bash)
        finderService = FinderService(fileManager: .default)
    }
    
}
