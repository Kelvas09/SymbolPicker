//
//  ContentView.swift
//  SymbolPickerSample
//
//  Created by Kévin Sibué on 13/01/2023.
//

import SwiftUI
import SymbolPicker

struct ContentView: View {

    @State
    var selectedSymbol: Symbol?

    @State
    var displaySymbolPicker: Bool = false

    @State
    var displayLimitedSymbolPicker: Bool = false

    var body: some View {
        VStack {
            VStack {
                Image(systemName: selectedSymbol?.value ?? "")
                    .font(.largeTitle)
            }
            .padding(8)
            Button {
                displaySymbolPicker = true
            } label: {
                Text("Select standard symbols")
            }
            .buttonStyle(.borderedProminent)
            Button {
                displayLimitedSymbolPicker = true
            } label: {
                Text("Select limited symbols (custom provider)")
            }
            .buttonStyle(.borderedProminent)
            .padding(.top, 8)
        }
        .padding()
        .sheet(isPresented: $displaySymbolPicker) {
            NavigationView {
                SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange)
                    .navigationTitle("Symbols")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .sheet(isPresented: $displayLimitedSymbolPicker) {
            NavigationView {
                SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange, symbolProvider:  LimitedSymbolProvider())
                    .navigationTitle("Symbols")
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
