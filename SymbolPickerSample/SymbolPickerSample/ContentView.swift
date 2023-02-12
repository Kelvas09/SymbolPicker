//
//  ContentView.swift
//  SymbolPickerSample
//
//  Created by Kévin Sibué on 13/01/2023.
//

import SwiftUI
import SymbolPicker

var provider: GenericProvider? = nil

struct ContentView: View {

    @State
    var selectedSymbol: Symbol?

    @State
    var displaySymbolPicker: Bool = false

    @State
    var displayCustomPicker: Bool = false

    @State
    var displayCategoryPicker: Bool = false

    var body: some View {
        List {
            VStack {
                Image(systemName: selectedSymbol?.value ?? "")
                    .font(.largeTitle)
            }
            .padding(8)
            Section("All") {
                Button {
                    displaySymbolPicker = true
                } label: {
                    Text("Select standard symbols")
                }
                .buttonStyle(.borderedProminent)
                .listRowSeparator(.hidden)
            }
            Section("Providers") {
                ForEach(SymbolProviderType.allCases, id: \.self) { type in
                    Button {
                        provider = GenericProviderFactory.create(type: type)
                        displayCustomPicker = true
                    } label: {
                        Text("Select \(type.name) symbols")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 8)
                    .listRowSeparator(.hidden)
                }
            }
            Section("All with categories") {
                Button {
                    displayCategoryPicker = true
                } label: {
                    Text("Select symbols inside categories")
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .sheet(isPresented: $displaySymbolPicker) {
            NavigationView {
                SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange)
                    .navigationTitle("Symbols")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .sheet(isPresented: $displayCustomPicker) {
            if let provider = provider {
                NavigationView {
                    SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange, symbolProvider:  provider)
                        .navigationTitle("Symbols")
                        .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
        .sheet(isPresented: $displayCategoryPicker) {
            NavigationView {
                SymbolCategoryPickerView(
                    selectedSymbol: $selectedSymbol,
                    selectedColor: .orange,
                    categories: FullCategoriesSymbolProvider().categories)
                    .navigationTitle("Categories")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
