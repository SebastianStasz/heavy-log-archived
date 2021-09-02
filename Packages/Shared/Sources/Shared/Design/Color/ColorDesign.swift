//
//  ColorDesign.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 27/08/2021.
//

import SwiftUI

enum ColorDesign {
    typealias design = Self

    enum AccentColor: String, ColorAsset {
        case accent_green_light
        case accent_green
        case accent_orange_light
        case accent_orange
        case accent_red_light
        case accent_red
    }

    enum Basic: String, ColorAsset {
        case action_primary
        case basic_primary_inverted
        case basic_primary
        case basic_secondary
    }

    enum AccentGray: String, ColorAsset {
        case gray_dark_primary_05
        case gray_dark_primary
        case gray_dark_secondary
        case gray_light_primary
        case gray_light_secondary
        case gray_medium
    }
}

protocol ColorAsset {
    var rawValue: String { get }
}

extension ColorAsset {
    var color: Color { Color(self.rawValue, bundle: .module) }
}
