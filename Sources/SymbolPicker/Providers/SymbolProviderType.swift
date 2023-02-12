//
//  SymbolProviderType.swift
//  
//
//  Created by Kévin Sibué on 12/02/2023.
//

import Foundation

public enum SymbolProviderType: CaseIterable {

    case accessibility
    case arrow
    case camera
    case communication
    case confidentiality
    case connectivity
    case devices
    case edit
    case game
    case health
    case hint
    case home
    case human
    case keyboard
    case maths
    case multimedia
    case nature
    case objects
    case shape
    case shop
    case sport
    case text
    case time
    case transport
    case weather

    public var name: String {
        switch self {
        case .accessibility: return "Accessibility"
        case .arrow: return "Arrow"
        case .camera: return "Camera"
        case .communication: return "Communication"
        case .confidentiality: return "Confidentiality"
        case .connectivity: return "Connectivity"
        case .devices: return "Devices"
        case .edit: return "Edit"
        case .game: return "Game"
        case .health: return "Health"
        case .hint: return "Hint"
        case .home: return "Home"
        case .human: return "Human"
        case .keyboard: return "Keyboard"
        case .maths: return "Maths"
        case .multimedia: return "Multimedia"
        case .nature: return "Nature"
        case .objects: return "Objects and Tools"
        case .shape: return "Shape"
        case .shop: return "Shop"
        case .sport: return "Sport"
        case .text: return "Text"
        case .time: return "Time"
        case .transport: return "Transport"
        case .weather: return "Weather"
        }
    }

    public var filename: String {
        return "\(self)"
    }

}
