//
//  ColorDesign.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 27/08/2021.
//

import SwiftUI

enum ColorDesign: String {
    case accentColor = "Accent color"
    case accentGray = "Accent gray"
    case basic = "Basic"

    enum AccentColor: String, ColorAsset, CaseIterable, Identifiable {
        case accent_green_light
        case accent_green
        case accent_orange_light
        case accent_orange
        case accent_red_light
        case accent_red

        var id: String { rawValue }
    }

    enum AccentGray: String, ColorAsset, CaseIterable, Identifiable {
        case gray_dark_primary_05
        case gray_dark_primary
        case gray_dark_secondary
        case gray_light_primary
        case gray_light_secondary
        case gray_medium

        var id: String { rawValue }
    }

    enum Basic: String, ColorAsset, CaseIterable, Identifiable {
        case action_primary
        case basic_primary_inverted
        case basic_primary
        case basic_secondary

        var id: String { rawValue }
    }
}

// MARK: - Helpers

extension ColorDesign: Identifiable, CaseIterable {

    var id: String { rawValue }

    var title: String {
        rawValue.capitalized
    }

    var colors: [ColorAsset] {
        switch self {
        case .accentColor:
            return AccentColor.allCases
        case .accentGray:
            return AccentGray.allCases
        case .basic:
            return Basic.allCases
        }
    }

    static var groups: [Self] {
        Self.allCases
    }
}
