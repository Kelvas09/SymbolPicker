//
//  GenericProviderFactory.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

public class GenericProviderFactory {

    public static func create(type: SymbolProviderType) -> GenericProvider {
        return GenericProvider(name: type.name, filename: type.filename)
    }

}
