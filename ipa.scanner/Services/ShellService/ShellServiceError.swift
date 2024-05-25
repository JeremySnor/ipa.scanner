//
//  ShellServiceError.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

enum ShellServiceError: LocalizedError {
    
    case commandNotFound(commandName: String, shellType: ShellType)
    case shellCommandFailedWithResult(ShellResult)
    
}
