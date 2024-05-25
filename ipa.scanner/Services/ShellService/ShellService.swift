//
//  ShellService.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

class ShellService: Printer {
    
    func shell(_ shellType: ShellType = .bash, command: String, arguments: [String] = []) throws {
        let whichResult = which(command: command, usingShellType: shellType)
        guard whichResult.statusCode == .success else {
            throw ShellServiceError.commandNotFound(commandName: command, shellType: shellType)
        }
        
        let commandResult = shell(launchPath: whichResult.outputString, arguments: arguments)
        guard commandResult.statusCode == .success else {
            throw ShellServiceError.shellCommandFailedWithResult(commandResult)
        }
    }
    
}

private extension ShellService {
    
    func which(command: String, usingShellType shellType: ShellType) -> ShellResult {
        shell(
            launchPath: shellType.launchPath,
            arguments: ["-l", "-c", "which \(command)"]
        )
    }
    
    func shell(launchPath: String, arguments: [String]) -> ShellResult {
        let process = Process()
        process.launchPath = launchPath
        process.arguments = arguments
        
        let pipe = Pipe()
        process.standardOutput = pipe
        
        #if DEBUG
        print(info: "Lanuching process \"\(launchPath)\" with arguments \(arguments)")
        #endif
        
        process.launch()
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        process.waitUntilExit()
        
        let result: ShellResult
        
        if let outputString = String(data: data, encoding: .utf8), outputString.isNotEmpty {
            result = ShellResult(
                outputString: String(outputString.dropLast(1)),
                status: process.terminationStatus
            )
        } else {
            result = ShellResult(status: process.terminationStatus)
        }
        
        #if DEBUG
        print(info: "Process \"\(launchPath)\" finished with\n\(result)")
        #endif
        
        return result
    }
    
}
