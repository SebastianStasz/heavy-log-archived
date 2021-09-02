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

    case accentGreen
    case accentRed
    case accentOrange
    case accentGreenLight
    case accentRedLight
    case accentOrangeLight

    case tabBarActionButton
    case tabBarPopupForeground
    case tabBarPopupBackground
    case tabBarButton
    case tabBarButtonSelected

    case backgroundMain
    case backgroundSecondary

    case grayLightPrimary
    case grayLightSecondary
    case grayMedium

    case textMainBold
    case textMainNormal
    case textMainLight
    case textMainThin

    public var color: Color {
        switch self {

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

        // MARK: - Tab Bar

        case .tabBarActionButton:
            return AccentColor.accent_red.color
        case .tabBarPopupForeground:
            return AccentColor.accent_red.color
        case .tabBarPopupBackground:
            return AccentColor.accent_red_light.color
        case .tabBarButton:
            return AccentGray.gray_medium.color
        case .tabBarButtonSelected:
            return AccentColor.accent_red.color

        // MARK: - Background

        case .backgroundMain:
            return Basic.basic_secondary.color
        case .backgroundSecondary:
            return Basic.basic_primary.color

        case .grayLightPrimary:
            return AccentGray.gray_light_primary.color
        case .grayLightSecondary:
            return AccentGray.gray_light_secondary.color
        case .grayMedium:
            return AccentGray.gray_medium.color

        // MARK: - Text

        case .textMainBold:
            return Basic.basic_primary_inverted.color
        case .textMainNormal:
            return AccentGray.gray_dark_primary.color
        case .textMainLight:
            return AccentGray.gray_dark_secondary.color
        case .textMainThin:
            return AccentGray.gray_dark_primary_05.color
        }
    }
}
