//
//  GenericProvider.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

public class GenericProvider: SymbolProvider, SymbolCategoryProvider {

    private let name: String
    private let filename: String

    public var symbols: [Symbol] {
        return SymbolFileReader.read(on: filename)
    }

    public var category: SymbolCategory {
        return SymbolCategory(name: name, symbols: symbols)
    }

    public init(name: String, filename: String) {
        self.name = name
        self.filename = filename
    }

}
