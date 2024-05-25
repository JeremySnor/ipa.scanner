//
//  ShellResult.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

struct ShellResult: CustomDebugStringConvertible {
    
    let outputString: String
    let statusCode: ShellStatusCode
    
    init(outputString: String = "", status: Int32) {
        self.outputString = outputString
        self.statusCode = ShellStatusCode(rawValue: status)
    }
    
    var debugDescription: String {
        "Status code: \(statusCode.rawValue)\nOutput:\n\(outputString)"
    }
    
}
