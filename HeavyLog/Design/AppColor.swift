//
//  AppColor.swift
//  HeavyLog
//
//  Created by Sebastian Staszczyk on 23/07/2021.
//

import SwiftUI

// MARK: - App Color

enum AppColor {
    private typealias design = ColorDesign

    case backgroundMain
    case backgroundSecondary

    case accentMain
    case accentGrayMain
    case grayLight

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

    var color: Color {
        switch self {
        case .backgroundMain:
            return Color(.secondarySystemBackground)
        case .backgroundSecondary:
            return Color(.systemBackground)

        case .accentMain:
            return Color("accentMain")
        case .accentGrayMain:
            return Color("accentGrayMain")
        case .grayLight:
            return design.gray100.color

        case .textMainBold:
            return .primary
        case .textMainNormal:
            return design.gray500.color
        case .textMainLight:
            return design.gray400.color
        case .textMainThin:
            return design.gray500_05.color

        case .accentGreen:
            return Color("accentGreen")
        case .accentRed:
            return Color("accentRed")
        case .accentOrange:
            return Color("accentOrange")
        case .accentGreenLight:
            return Color("accentGreenLight")
        case .accentRedLight:
            return Color("accentRedLight")
        case .accentOrangeLight:
            return Color("accentOrangeLight")
        }
    }
}

// MARK: - Color Design

private enum ColorDesign {
    typealias design = Self

    case gray100
    case gray500
    case gray400
    case gray500_05

    var color: Color {
        switch self {
        case .gray100:
            return Color("gray100")
        case .gray500:
            return Color("gray500")
        case .gray400:
            return Color("gray400")
        case .gray500_05:
            return design.gray500.color.opacity(0.5)
        }
    }
}

// MARK: - Color Extensions

extension Color {

    static var backgroundMain: Color {
        AppColor.backgroundMain.color
    }

    static var backgroundSecondary: Color {
        AppColor.backgroundSecondary.color
    }

    static var accentMain: Color {
        AppColor.accentMain.color
    }

    static var accentGrayMain: Color {
        AppColor.accentGrayMain.color
    }

    static var grayLight: Color {
        AppColor.grayLight.color
    }

    static var textMainBold: Color {
        AppColor.textMainBold.color
    }

    static var textMainNormal: Color {
        AppColor.textMainNormal.color
    }

    static var textMainLight: Color {
        AppColor.backgroundSecondary.color
    }

    static var textMainThin: Color {
        AppColor.backgroundSecondary.color
    }

    static var accentGreen: Color {
        AppColor.accentGreen.color
    }

    static var accentRed: Color {
        AppColor.accentRed.color
    }

    static var accentOrange: Color {
        AppColor.accentOrange.color
    }

    static var accentGreenLight: Color {
        AppColor.accentGreenLight.color
    }

    static var accentRedLight: Color {
        AppColor.accentRedLight.color
    }

    static var accentOrangeLight: Color {
        AppColor.accentOrangeLight.color
    }
}
