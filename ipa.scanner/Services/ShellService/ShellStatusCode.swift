//
//  ShellStatusCode.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

struct ShellStatusCode: RawRepresentable {
    
    let rawValue: Int32
    
    init(rawValue: Int32) {
        self.rawValue = rawValue
    }
    
}

extension ShellStatusCode {
    
    static let success = ShellStatusCode(rawValue: 0)
    
}
