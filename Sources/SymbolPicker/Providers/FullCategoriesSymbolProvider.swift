//
//  FullCategoriesSymbolProvider.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

public class FullCategoriesSymbolProvider {

    public var categories: [SymbolCategory] {
        return SymbolProviderType.allCases.map { type in
            return GenericProviderFactory.create(type: type).category
        }
    }

    public init() { }

}
