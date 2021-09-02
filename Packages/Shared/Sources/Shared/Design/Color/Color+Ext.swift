//
//  Color+Ext.swift
//  Shared
//
//  Created by Sebastian Staszczyk on 27/08/2021.
//

import SwiftUI

public extension Color {

    private typealias Basic = ColorDesign.Basic
    private typealias AccentColor = ColorDesign.AccentColor
    private typealias AccentGray = ColorDesign.AccentGray

    // MARK: - Accent Color

    static var accentGreenLight: Color {
        AccentColor.accent_green_light.color
    }

    static var accentGreen: Color {
        AccentColor.accent_green.color
    }

    static var accentOrangeLight: Color {
        AccentColor.accent_orange_light.color
    }

    static var accentOrange: Color {
        AccentColor.accent_orange.color
    }

    static var accentRedLight: Color {
        AccentColor.accent_red_light.color
    }

    static var accentRed: Color {
        AccentColor.accent_red.color
    }

    // MARK: Accent Gray

    static var grayDarkPrimary05: Color {
        AccentGray.gray_dark_primary_05.color
    }

    static var grayDarkPrimary: Color {
        AccentGray.gray_dark_primary.color
    }

    static var grayDarkSecondary: Color {
        AccentGray.gray_dark_secondary.color
    }

    static var grayLightPrimary: Color {
        AccentGray.gray_light_primary.color
    }

    static var grayLightSecondary: Color {
        AccentGray.gray_light_secondary.color
    }

    static var grayMedium: Color {
        AccentGray.gray_medium.color
    }

    // MARK: - Basic

    static var actionPrimary: Color {
        Basic.action_primary.color
    }

    static var basicPrimaryInverted: Color {
        Basic.basic_primary_inverted.color
    }

    static var basicPrimary: Color {
        Basic.basic_primary.color
    }

    static var basicSecondary: Color {
        Basic.basic_secondary.color
    }
}
