//
//  DefaultSymbolProvider.swift
//  
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation

public final class DefaultSymbolProvider: SymbolProvider {

    public var symbols: [Symbol] {
        return SymbolFileReader.read(on: "symbols")
    }

    public init() { }

}
