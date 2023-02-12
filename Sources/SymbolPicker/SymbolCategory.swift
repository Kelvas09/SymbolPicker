//
//  SymbolCategory.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

public struct SymbolCategory: Hashable {

    public let name: String
    public let symbols: [Symbol]

    public init(name: String, symbols: [Symbol]) {
        self.name = name
        self.symbols = symbols
    }
    
}
