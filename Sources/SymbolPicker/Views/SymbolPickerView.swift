//
//  SymbolPickerView.swift
//
//
//  Created by Kévin Sibué on 13/01/2023.
//

import SwiftUI

public struct SymbolPickerView: View {

    @Environment(\.dismiss)
    var dismiss

    @Binding
    public var selectedSymbol: Symbol?

    @State
    private var search: String = ""

    private var selectedColor: Color
    private var searchEnabled: Bool

    public init(selectedSymbol: Binding<Symbol?>, searchEnabled: Bool = false, selectedColor: Color = .blue, symbolProvider: SymbolProvider = DefaultSymbolProvider()) {
        self._selectedSymbol = selectedSymbol
        self.selectedColor = selectedColor
        self.searchEnabled = searchEnabled
        self.symbols = symbolProvider.symbols
    }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    let symbols: [Symbol]

    private var searchResults: [Symbol] {
        if search.isEmpty {
            return symbols
        } else {
            return symbols
                .filter { $0.value.lowercased().contains(search.lowercased()) }
        }
    }

    public var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(searchResults, id: \.self) { symbol in
                    RoundedRectangle(cornerRadius: 16)
                        .fill((selectedSymbol == symbol ? selectedColor : Color.gray).opacity(0.4))
                        .frame(width: 64, height: 64)
                        .overlay {
                            Image(systemName: symbol.value)
                                .font(.largeTitle)
                        }
                        .onTapGesture {
                            selectedSymbol = symbol
                            dismiss()
                        }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
        .searchable(text: $search)
    }

}

struct EmojiPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolPickerView(selectedSymbol: .constant(Symbol(value: "xmark")))
    }
}
