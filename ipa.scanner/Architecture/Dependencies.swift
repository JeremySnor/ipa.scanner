//
//  Dependencies.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

protocol Dependencies {
    
    var shellService: ShellService { get }
    var finderService: FinderService { get }
    
}
