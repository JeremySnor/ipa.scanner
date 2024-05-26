//
//  ApplicationDependencies.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class ApplicationDependencies: Dependencies {
    
    let shellService: ShellService
    
    init() {
        shellService = ShellService(shellType: .bash)
    }
    
}
