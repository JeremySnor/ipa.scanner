//
//  ShellType.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

enum ShellType {
    
    case bash
    case zsh
    
    var launchPath: String {
        switch self {
        case .bash:
            return "/bin/bash"
            
        case .zsh:
            return "/bin/zsh"
        }
    }
    
}
