//
//  Symbol.swift
//  
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation

public struct Symbol: Identifiable, Hashable {

    public let id: String
    public let value: String

    public init(value: String) {
        self.id = value
        self.value = value
    }

}
