![Symbol Picker](./.assets/header.png)

## Goal

You probably know SF Symbols from Apple allowing you to use icons and symbols directly in your application without having to import any image.

SymbolPicker allows you to offer a view to your users to select a symbol very easily.

## NEWS !

### v1.1.0

⚠️ **WARNING** Breaking change on `SymbolProvider`: method `getAll()`has been replaced with property `symbols: [Symbol]`. If you use a custom provider which implement this protocol you must update it:

**Old implementation**

```swift
final class LimitedSymbolProvider: SymbolProvider {

    func getAll() -> [Symbol] {
        return [
            Symbol(value: "xmark"),
            Symbol(value: "square.and.arrow.down"),
            Symbol(value: "highlighter"),
            Symbol(value: "paperplane.fill"),
            Symbol(value: "calendar.day.timeline.left"),
        ]
    }

}
```

**New implementation**

```swift
final class LimitedSymbolProvider: SymbolProvider {

    var symbols: [Symbol] {
        return [
            Symbol(value: "xmark"),
            Symbol(value: "square.and.arrow.down"),
            Symbol(value: "highlighter"),
            Symbol(value: "paperplane.fill"),
            Symbol(value: "calendar.day.timeline.left"),
        ]
    }

}
```

## Screenshots and video

|Standard|Search|Custom|Categories|
|---|---|---|---|
|![standard list](./.assets/standards.png)|![search](./.assets/search.png)|![search](./.assets/limited.png)|![categories](./.assets/categories.png)|


|1.0.0|1.1.0|
|---|---|
|![Demo](./.assets/vid.gif)|![categories](./.assets/1.1.0.gif)|

## Dependencies

- SwiftUI (iOS >= 15.0)

## How install it?

Nowaday we only support Swift Package Manager. You can use build-in UI tool for XCode with this search words: `SymbolPicker` or you can add it directly with this following command :

```swift
.package(url: "https://github.com/Kelvas09/SymbolPicker.git", from: "1.1.0")
```

## How use it?

First of all you have to import the library `SymbolPicker`:

```swift
import SymbolPicker
```

You then have the option of using the `SymbolPickerView`. This view represents the list of selectable symbols.

The latter is not embedded in a NavigationView. If you want to display it with a title, you have to do it yourself:

```swift
...
NavigationView {
    SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange)
        .navigationTitle("Symbols")
        .navigationBarTitleDisplayMode(.inline)
}
...
```

Here is a complete example:

```swift
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
        }
        .padding()
        .sheet(isPresented: $displaySymbolPicker) {
            NavigationView {
                SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange)
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

```

### Select color

When a user selects a symbol, it is highlighted. By default the selection color is `blue` but you can change this value when creating the view: 

```swift
SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange)
```

### Enable search

By default the search for symbols is allowed in the picker, it is however possible to change this setting when creating the view:

```swift
SymbolPickerView(selectedSymbol: $selectedSymbol, searchEnabled: false)
```

⚠️ **WARNING** Search is only possible when `SymbolPickerView` is embed on `NavigationView`.

### Custom symbols provider

`SymbolPickerView` embeds `SymbolProvider` protocol with a default implementation: `DefaultSymbolProvider`. This class allows to retrieve all existing symbols. 

When you build an `SymbolPickerView`, by default it uses this class to get the list of symbols to display.

If you want to use your own symbol list, you can create your own class by implementing the `SymbolProvider` protocol :

```swift
import Foundation
import SymbolPicker

final class LimitedSymbolProvider: SymbolProvider {

    var symbols: [Symbol] {
        return [
            Symbol(value: "xmark"),
            Symbol(value: "square.and.arrow.down"),
            Symbol(value: "highlighter"),
            Symbol(value: "paperplane.fill"),
            Symbol(value: "calendar.day.timeline.left"),
        ]
    }

}
```

And then use it in the creation of the view:

```swift
...
NavigationView {
    SymbolPickerView(selectedSymbol: $selectedSymbol, selectedColor: .orange, symbolProvider:  LimitedSymbolProvider())
        .navigationTitle("Symbols")
        .navigationBarTitleDisplayMode(.inline)
}
...
```

### The different types of providers

With version `1.1.0` it is possible to retrieve only a subset of symbols from a category. These categories are identified via the `SymbolProviderType` enumerator.

The `GenericProviderFactory` class will allow you to generate a provider for the type you have chosen:

```swift
...
GenericProviderFactory.create(type: .camera)
...
```

### Symbol categories

With version `1.1.0` it is now possible to display the symbols sorted by category: 

![categories](./.assets/1.1.0.gif)

For this you will need to use the new `SymbolCategoryPickerView` view:

```swift
...
NavigationView {
    SymbolCategoryPickerView(
        selectedSymbol: $selectedSymbol,
        selectedColor: .orange,
        categories: FullCategoriesSymbolProvider().categories)
        .navigationTitle("Categories")
        .navigationBarTitleDisplayMode(.inline)
}
...
```

In the same way as the `SymbolPickerView` you can specify the pre-selected *symbol* and the *color*.

On the other hand, here you must specify the list of categories to be displayed. By default you can use the class `FullCategoriesSymbolProvider` which will give you access to all existing categories in SF Symbols.

It is possible to create your own class which will then give access to a subset of symbols.

⚠️ **WARNING** Search is only possible when `SymbolCategoryPickerView` is embed on NavigationView.

## Similar

If you are interested in this package you will probably also be interested in an emoji picker: [EmojiPicker](https://github.com/Kelvas09/EmojiPicker)

## Samples

You can access to sample project on folder `SymbolPickerSample`
