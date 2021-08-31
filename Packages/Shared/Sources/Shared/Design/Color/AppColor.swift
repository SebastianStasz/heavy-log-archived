//
//  AppColor.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/07/2021.
//

import SwiftUI

public enum AppColor {
    private typealias Basic = ColorDesign.Basic
    private typealias AccentColor = ColorDesign.AccentColor
    private typealias AccentGray = ColorDesign.AccentGray

    case backgroundMain
    case backgroundSecondary

    case accentMain
    case accentGrayMain

    case grayLightPrimary
    case grayLightSecondary

    case textMainBold
    case textMainNormal
    case textMainLight
    case textMainThin

    case accentGreen
    case accentRed
    case accentOrange
    case accentGreenLight
    case accentRedLight
    case accentOrangeLight

    public var color: Color {
        switch self {
        case .backgroundMain:
            return Basic.basic_secondary.color
        case .backgroundSecondary:
            return Basic.basic_primary.color

        case .accentMain:
            return Color("accentMain")
        case .accentGrayMain:
            return Color("accentGrayMain")

        case .grayLightPrimary:
            return AccentGray.gray_light_primary.color
        case .grayLightSecondary:
            return AccentGray.gray_light_secondary.color

        case .textMainBold:
            return Basic.basic_primary_inverted.color
        case .textMainNormal:
            return AccentGray.gray_dark_primary.color
        case .textMainLight:
            return AccentGray.gray_dark_secondary.color
        case .textMainThin:
            return AccentGray.gray_dark_primary_05.color

        // MARK: Accent Color

        case .accentRed:
            return AccentColor.accent_red.color
        case .accentOrange:
            return AccentColor.accent_orange.color
        case .accentGreen:
            return AccentColor.accent_green.color
        case .accentRedLight:
            return AccentColor.accent_red_light.color
        case .accentOrangeLight:
            return AccentColor.accent_orange_light.color
        case .accentGreenLight:
            return AccentColor.accent_green_light.color
        }
    }
}
