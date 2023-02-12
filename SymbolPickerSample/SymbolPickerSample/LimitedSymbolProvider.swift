//
//  LimitedSymbolProvider.swift
//  SymbolPickerSample
//
//  Created by Kévin Sibué on 13/01/2023.
//

import Foundation
import SymbolPicker

final class LimitedSymbolProvider: SymbolProvider {

    var symbols: [SymbolPicker.Symbol] {
        [
            Symbol(value: "xmark"),
            Symbol(value: "square.and.arrow.down"),
            Symbol(value: "highlighter"),
            Symbol(value: "paperplane.fill"),
            Symbol(value: "calendar.day.timeline.left"),
        ]
    }

}
