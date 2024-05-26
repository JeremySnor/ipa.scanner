//
//  Mock.swift
//  ipa.scanner
//
//  Created by Artem Eremeev on 26.05.2024.
//

import Foundation

#if DEBUG
protocol Mock {
    
    static func mockInstance() -> Self
    
}
#endif
