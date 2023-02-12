//
//  SymbolCategoryPickerView.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import SwiftUI

public struct SymbolCategoryPickerView: View {

    @Environment(\.dismiss)
    var dismiss

    @Binding
    public var selectedSymbol: Symbol?

    @State
    private var search: String = ""

    private var selectedColor: Color
    private var searchEnabled: Bool

    public init(selectedSymbol: Binding<Symbol?>, searchEnabled: Bool = false, selectedColor: Color = .blue, categories: [SymbolCategory]) {
        self._selectedSymbol = selectedSymbol
        self.selectedColor = selectedColor
        self.searchEnabled = searchEnabled
        self.categories = categories
    }

    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    let categories: [SymbolCategory]

    private var searchResults: [SymbolCategory] {
        if search.isEmpty {
            return categories
        } else {
            return categories
                .compactMap {
                    let symbols = $0.symbols.filter { $0.value.lowercased().contains(search.lowercased())
                    }
                    if symbols.isEmpty {
                        return nil
                    } else {
                        return SymbolCategory(name: $0.name, symbols: symbols)
                    }
                }
        }
    }

    public var body: some View {
        GeometryReader { proxy in
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: 20
                ) {
                    ForEach(searchResults, id: \.self) { category in
                        Section {
                            ForEach(category.symbols) { symbol in
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
                            Spacer(minLength: 16)
                        } header: {
                            VStack {
                                Text(category.name)
                                    .font(.title3)
                                    .foregroundColor(Color.gray)
                                    .textCase(.uppercase)
                                    .padding(16)
                            }
                            .background()
                        }
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: .infinity)
            .searchable(text: $search)
        }
    }

}

struct SymbolCategoryPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolCategoryPickerView(
            selectedSymbol: .constant(Symbol(value: "xmark")),
            categories: FullCategoriesSymbolProvider().categories
        )
    }
}
