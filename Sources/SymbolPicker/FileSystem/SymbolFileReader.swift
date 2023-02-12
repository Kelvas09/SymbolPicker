//
//  SymbolFileReader.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

class SymbolFileReader {

    static func read(on filename: String) -> [Symbol] {
        if let path = Bundle.module.path(forResource: filename, ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let content = data.components(separatedBy: .newlines)
                return content.compactMap({
                    if $0.isEmpty {
                        return nil
                    } else {
                        return Symbol(value: $0)
                    }
                })
            } catch {
                return []
            }
        } else {
            return []
        }
    }

}
