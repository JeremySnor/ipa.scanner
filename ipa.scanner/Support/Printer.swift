//
//  Printer.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

fileprivate enum PrinterTarget: CustomStringConvertible {
    
    case info
    case error
    
    var description: String {
        switch self {
        case .info:
            return "INFO"
            
        case .error:
            return "ERROR"
        }
    }
    
}

protocol Printer { }

extension Printer {
    
    func print(info: String) {
        print(string: info, target: .info)
    }
    
    func print(error: Error) {
        print(string: error.localizedDescription, target: .error)
    }
    
}

private extension Printer {
    
    func print(string: String, target: PrinterTarget) {
        let location = String(describing: type(of: self))
        let result = "[\(location) \(target)]: \(string)"
        Swift.print(result)
    }
    
}
