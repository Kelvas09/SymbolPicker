//
//  DefaultSymbolProvider.swift
//  
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation

public final class DefaultSymbolProvider: SymbolProvider {

    public init() { }

    public func getAll() -> [Symbol] {
        if let path = Bundle.module.path(forResource: "symbols", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let content = data.components(separatedBy: .newlines)
                return content.map({ Symbol(value: $0) })
            } catch {
                return []
            }
        } else {
            return []
        }
    }

}
